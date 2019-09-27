# views.py (projects)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""Definition of Projects views."""

from datetime import datetime
from os.path import join
import json
import subprocess
import requests
from django.contrib.auth.decorators import login_required
from django.core import serializers
from django.http import HttpRequest, HttpResponse, HttpResponseRedirect
from django.middleware.csrf import get_token
from django.shortcuts import render, redirect
from django.utils.decorators import method_decorator
from django.views.generic import TemplateView, ListView, UpdateView, CreateView
from projects.forms import ProjectForm
from projects.models import Project

# Create your views here.
class ProjectListView(ListView):
    """View for viewing, editing, and creating Projects."""
    model = Project
    context_object_name = 'projects_list'
    queryset = Project.objects.all()
    template_name = 'index.html'

    #@method_decorator(login_required)
    #def get(self, request, *args, **kwargs):
    #    """Process the request and return either a view for a single Project, or a list of all Projects."""
    #    projects = Project.objects.all()
    #    return render(request, "index.html", {'projects': projects})

def get_projects(order):
    projects = list(Project.objects.values())
    #data = list(serializers.serialize('json', projects))
    data = json.dumps(projects)
    mimetype = 'application/json'
    return HttpResponse(data)

# TODO update this based on the Createview found:
# https://docs.djangoproject.com/en/2.2/ref/class-based-views/generic-editing/
class ProjectCreateView(CreateView):
    """View for creating a new Project."""

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form for creating a new Project."""
        ctx = {'form': ProjectForm()}
        return render(request, "create.html", ctx)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new Project form filled out."""
        form = ProjectForm(request.POST)
        if form.is_valid():
            form.save(commit=True)
            return render(request, 'index.html', {})
        return render(request, "create.html", {'form': form})


class ProjectEditView(UpdateView):
    """View for editing or viewing an existing Project."""
    model = Project
    form_class = ProjectForm
    template_name = 'edit.html'

    def form_valid(self, form):
        """Project Edit Form validation."""
        self.object = form.save(commit=False)
        self.object.save()
        return HttpResponseRedirect('/projects/projects/')
