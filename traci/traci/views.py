# views.py (traci)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""Definition of views."""

import requests
from django.contrib.auth.decorators import login_required
from django.http import HttpRequest
from django.middleware.csrf import get_token
from django.shortcuts import render, redirect
from django.template import RequestContext
from django.utils.decorators import method_decorator
from django.views.generic import TemplateView
from datetime import datetime


def home(request):
    """Navigate to the base page or dashboard, depending on user login status."""
    if request.user.is_authenticated:
        # Redirect to DashboardView::GET
        return redirect('dashboard')
    return render(request, 'main/base.html', {})


def contact(request):
    """Renders the contact page."""
    assert isinstance(request, HttpRequest)
    return render(
        request,
        'contact.html',
        {
            'title': 'Contact',
            'message': 'Your contact page.',
            'year': datetime.now().year,
        }
    )


def about(request):
    """Renders the about page."""
    assert isinstance(request, HttpRequest)
    return render(
        request,
        'main/about.html',
        {
            'title': 'About',
            'message': 'Your application description page.',
            'year': datetime.now().year,
        }
    )



class DashboardView(TemplateView):
    """View for the main dashboard."""

    template_name = "main/dashboard.html"

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Render the dashboard template."""
        ctx = {'open_tab': request.GET.get('show', 'teams'), 'user': request.user}
        ctx['profile'] = ctx['user'].userprofile

        if ctx['user'].first_name is not None and ctx['user'].first_name:
            ctx['layout_name'] = ctx['user'].first_name + "'s Dashboard"
        else:
            ctx['layout_name'] = ctx['user'].username + "'s Dashboard"

        api_domain = request.scheme + '://' + request.get_host()
        token = get_token(request)
        headers = {
            'X-CSRFToken': token,
            'Cookie': request.META["HTTP_COOKIE"]
        }

        # get the teams of which this user is a member
        teams_data = requests.get(api_domain + '/teams/api/team/', headers=headers)
        ctx['teams'] = teams_data.json()

        return render(request, 'main/dashboard.html', ctx)
