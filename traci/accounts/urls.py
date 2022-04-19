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

from django.urls import re_path
from accounts.views import login, logout, ProfileView, UserRegistrationView, \
    UserApprovalView, UserDenialView, PasswordResetRequestView, \
    PasswordResetConfirmView, UsernameReminderRequestView

urlpatterns = [
    # login
    re_path(r'^login/$', login, name='login'),
    re_path(r'^logout/$', logout, name='logout'),

    # view/edit existing profile
    re_path(r'^profile/$', ProfileView.as_view(), name='profile'),

    # new user registration
    re_path(r'^register/$', UserRegistrationView.as_view(), name='register'),
    # Give admins a chance to approve or deny new users, taken from Greenscope
    re_path(r'^register/approve/(?P<uidb64>[0-9A-Za-z]+)/$',
        UserApprovalView.as_view(),
        name='register_approve'),
    re_path(r'^register/deny/(?P<uidb64>[0-9A-Za-z]+)/$',
        UserDenialView.as_view(),
        name='register_deny'),
    # re_path(r'^register/activate/(?P<uidb64>[0-9A-Za-z]+)-(?P<token>.+)/$',
    #    UserActivationView.as_view(), name='register_activate'),

    # password management
    re_path(r'^password/reset/$',
        PasswordResetRequestView.as_view(),
        name="password_reset"),
    re_path(r'^password/reset/confirm/(?P<uidb64>[0-9A-Za-z]+)-(?P<token>.+)/$',
        PasswordResetConfirmView.as_view(),
        name='reset_password_confirm'),
    re_path(r'^password/reset/confirm/$',
        PasswordResetConfirmView.as_view(),
        name='reset_password_confirm_no_token'),

    # username management
    re_path(r'^username/$',
        UsernameReminderRequestView.as_view(),
        name="username_reminder"),
]
