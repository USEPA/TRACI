# views.py (app)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Definition of views.
"""

from django.shortcuts import render, redirect
from django.http import HttpRequest
from django.template import RequestContext
from datetime import datetime

def home(request):
    """Navigate to the base page or dashboard, depending on user login status."""
    if request.user.is_authenticated:
        # Redirect to DashboardView::GET
        return redirect('about')
    return render(request, 'main/base.html', {})

def contact(request):
    """Renders the contact page."""
    assert isinstance(request, HttpRequest)
    return render(
        request,
        'contact.html',
        {
            'title':'Contact',
            'message':'Your contact page.',
            'year':datetime.now().year,
        }
    )

def about(request):
    """Renders the about page."""
    assert isinstance(request, HttpRequest)
    return render(
        request,
        'main/about.html',
        {
            'title':'About',
            'message':'Your application description page.',
            'year':datetime.now().year,
        }
    )
