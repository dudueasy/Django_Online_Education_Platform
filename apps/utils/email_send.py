# # -*- coding: utf-8 -*-
from __future__ import unicode_literals
_date_ = '2018/1/12 上午4:27'
__author__ = 'apolo'


from random import randint
from django.core.mail import send_mail
from OlineEdu.settings import EMAIL_FROM
from users.models import EmailVerifyRecord


def generate_random_str(random_length=8):
    str = ''
    for i in range(random_length):
        n = randint(1,62)
        if n < 11:
            # 返回数字
            str += chr(randint(48,57))

        elif n < 37:
            # 返回大写字母
            str += chr(randint(65,90))
        else:
            # 返回小写字母
            str += chr(randint(97,122))
    return str


def send_register_email(email, send_type='register'):
    email_record = EmailVerifyRecord()
    random_str = generate_random_str(16)
    email_record.code = random_str
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    # 设置邮件的信息
    email_title = ''
    email_body = ''

    if send_type == 'register':
        email_title = '在线注册激活连接'
        email_body = '请点击下面的连接激活你的账号: http://127.0.0.1:8000/active/{0}'.format(random_str)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass

    if send_type == 'forget':
        email_title = '在线密码重置'
        email_body = '请点击下面的连接重置密码: http://127.0.0.1:8000/reset/{0}'.format(random_str)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
