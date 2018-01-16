# _*_ encoding:utf-8 _*_

import json

from django.shortcuts import render, render_to_response
from django.views.generic import View
from django.http import HttpResponse

from .models import  CourseOrg, CityDict
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from .forms import UserAskForm
# Create your views here.


class OrgView(View):

    #课程机构列表页面
    def get(self, request):

        # 从数据库获得的数据
        all_orgs = CourseOrg.objects.all()
        all_citys = CityDict.objects.all()
        ## 热门机构
        hot_orgs = all_orgs.order_by('-click_num')[:3]

        #从get请求获得的数据
        city_id = request.GET.get('city', '')
        category = request.GET.get('category','')
        sort = request.GET.get('sort','')

        #机构排序
        if sort:
            all_orgs = all_orgs.order_by("-%s"%(sort))

        #城市名筛选功能
        if city_id:
            all_orgs = all_orgs.filter(city_id = int(city_id))
        if category:
            all_orgs = all_orgs.filter(category = category)

        org_nums = all_orgs.count()


        # 对课程机构进行分页
        try:
            page = int(request.GET.get('page', 1))
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_orgs, per_page=5, request=request)

        orgs = p.page(page)

        return render(request, 'org-list.html',{
            'all_orgs': orgs,
            'all_citys': all_citys,
            'org_nums':org_nums,
            'city_id':city_id,
            'category': category,
            'hot_orgs':hot_orgs,
            'sort':sort,
        })


class AddUserAskView(View):
    '''用户提交咨询'''
    def post(self, request):
        userask_form = UserAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            return HttpResponse(json.dumps({'status':'success'}), content_type='application/json')

        else:
            return HttpResponse(json.dumps({'status':'fail', 'msg':'添加出错'}), content_type='application/json')


