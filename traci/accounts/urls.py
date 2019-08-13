# urls.py (accounts)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# pylint: disable=invalid-name
# We disable the invalid name because urlpatterns is the Django default

"""
Module related to urls for user accounts.

Available functions:
- Login
- View/edit profile
- New user registration
- Password Management
- Username management
"""

from django.conf.urls import url
from accounts.views import login, logout, ProfileView, UserRegistrationView, \
    UserApprovalView, UserDenialView, PasswordResetRequestView, \
    PasswordResetConfirmView, UsernameReminderRequestView

urlpatterns = [
    # login
    url(r'^login/$', login, name='login'),
    url(r'^logout/$', logout, name='logout'),

    # view/edit existing profile
    url(r'^profile/$', ProfileView.as_view(), name='profile'),

    # new user registration
    url(r'^register/$', UserRegistrationView.as_view(), name='register'),
    # Give admins a chance to approve or deny new users, taken from Greenscope
    url(r'^register/approve/(?P<uidb64>[0-9A-Za-z]+)/$',
        UserApprovalView.as_view(), name='register_approve'),
    url(r'^register/deny/(?P<uidb64>[0-9A-Za-z]+)/$',
        UserDenialView.as_view(), name='register_deny'),
    # url(r'^register/activate/(?P<uidb64>[0-9A-Za-z]+)-(?P<token>.+)/$',
    #    UserActivationView.as_view(), name='register_activate'),

    # password management
    url(r'^password/reset/$', PasswordResetRequestView.as_view(),
        name="password_reset"),

    url(r'^password/reset/confirm/(?P<uidb64>[0-9A-Za-z]+)-(?P<token>.+)/$',
        PasswordResetConfirmView.as_view(), name='reset_password_confirm'),
    url(r'^password/reset/confirm/$', PasswordResetConfirmView.as_view(),
        name='reset_password_confirm_no_token'),

    # username management
    url(r'^username/$', UsernameReminderRequestView.as_view(),
        name="username_reminder"),

]
