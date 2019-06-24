# views.py (traci)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""Definition of views."""

import requests
import subprocess
from django.contrib.auth.decorators import login_required
from django.http import HttpRequest, HttpResponse
from django.middleware.csrf import get_token
from django.shortcuts import render, redirect
from django.template import RequestContext
from django.utils.decorators import method_decorator
from django.views.generic import TemplateView
from datetime import datetime
from os.path import join
from traci.settings import CITE_SCRIPT, DOWNLOADS_DIR, MANUAL_NAME, EXCEL_TOOL_NAME


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


def citation(request):
    """
    Download TRACI citations as a text file.

    :param request:
    :return:
    """
    process = subprocess.Popen([CITE_SCRIPT], stdout=subprocess.PIPE)
    out, err = process.communicate()
    print(out)
    citation_split = out.split("\\r\\n")
    citation_str = citation_split[citation_split.len - 1]
    return citation_str


def export_excel(form, results, type):
    """Send results to the user as an Excel file."""
    from openpyxl import Workbook
    from openpyxl.styles import PatternFill, Font
    from openpyxl.styles.borders import Border, Side
    from openpyxl.styles.colors import Color
    filename = "Placeholder.xlsx"
    # Now return the generated excel sheet to be downloaded.
    response = HttpResponse(content_type="application/vnd.vnd.openxmlformats-officedocument.spreadsheetml.sheet")
    response['Content-Disposition'] = 'attachment; filename="%s"' % filename
    sheet.title = filename.split('.')[0]
    workbook.save(response)
    return response


def download_file(reposnse, name):
    """Receives the path, name, extension of file to be returned to user."""
    name_split = name.split('.')
    ext = name_split[len(name_split) - 1]
    file = join(DOWNLOADS_DIR, name)

    if ext == 'pdf':
        with open(file, 'rb') as pdf:
            response = HttpResponse(pdf)
            response['Content-Disposition'] = 'attachment; filename="' + name + '"'
            return response

    elif ext == 'docx':
        with open(file, 'rb') as doc:
            response = HttpResponse(doc)
            response['Content-Disposition'] = 'attachment; filename="' + name + '"'
            return response

    elif 'xls' in ext:
        with open(file, 'rb') as xls:
            response = HttpResponse(xls, content_type="application/vnd.vnd.openxmlformats-officedocument.spreadsheetml.sheet")
            response['Content-Disposition'] = 'attachment; filename="' + name + '"'
            return response

    return HttpResponse()


@login_required
def download_manual(request):
    """Receives GET requests will start download GWSC user manual stored on the server."""
    return download_file(request, MANUAL_NAME)


@login_required
def download_excel_tool(request):
    """Receives GET requests will start download GWSC Excel Tool stored on the server."""
    return download_file(request, EXCEL_TOOL_NAME)