# views.py (support)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Views for support application.

Available functions:
- View to present and process the "request more info" form.
- View to present and process the user manual view.
"""

from datetime import datetime, timedelta
from decimal import getcontext
from django.contrib.auth.decorators import login_required
from django.core.mail import send_mail
from django.db.models import Q
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404
from django.views.decorators.cache import never_cache
from django.views.generic import FormView
from django.shortcuts import render
from support.forms import InformationRequestForm, SupportForm, SupportAdminForm, SupportTypeForm, PriorityForm
from support.models import Support, Priority, SupportType
getcontext().prec = 9


class RequestInformationView(FormView):
    """
    View to present and process the "request more info" form.

    :param request:
    :return:
    """

    form_class = InformationRequestForm

    def get(self, request, *arg, **kwargs):
        """Present the request info form."""
        form = self.form_class()
        return render(request, 'main/request_info.html', {'form': form})

    def post(self, request, *arg, **kwargs):
        """
        Send email with information request to the website manager.

        :param request:
        :param arg:
        :param kwargs:
        :return:
        """
        form = self.form_class(request.POST)
        return render(request, 'main/request_info_done.html', {'form': form})


class UserManualView(FormView):
    """
    View to present and process the "request more info" form.

    :param request:
    :return:
    """

    form_class = InformationRequestForm

    def get(self, request, *args, **kwargs):
        """Present the request info form."""
        form = self.form_class()
        return render(request, 'main/manual.html', {'form': form})


@login_required
def index(request):
    """TODO Add docstring."""
    user = request.user
    title = "Support Main Page"
    objs = Support.objects.filter(user=user)
    return render(request, 'main/support.html', {'user': user, 'title': title, 'objs': objs})


@login_required
def create_support(request):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'title': "Create a New Support Issue", 'supports': Support.objects.all()}

    if request.method == "POST":
        ctx['form'] = SupportForm(data=request.POST, files=request.FILES)
        if ctx['form'].is_valid():
            if 'files' in request.FILES:
                ctx['files'] = request.FILES['files']
                ctx['files'].user = ctx['user']

            ctx['support'] = ctx['form'].save(commit=False)

            ctx['support'].user = ctx['user']
            ctx['support'].created_by = ctx['user'].username
            ctx['support'].last_modified_by = ctx['user'].username
            ctx['support'].save()
            send_mail('TRACI Support Request',
                      'A TRACI Support Request Has Been Submitted. Here is the description of the issue: %s'
                      % str(ctx['support'].the_description), ctx['support'].weblink, ['young.daniel@epa.gov'], fail_silently=False)
            url = '/support/show/%s/' % str(ctx['support'].id)
            return HttpResponseRedirect(url)
    else:
        ctx['form'] = SupportForm()
    return render(request, 'create/create.html', ctx)


@login_required
def edit_support(request, obj_id):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'title': "Update Support", 'support': Support.objects.get(id=obj_id)}

    if ctx['user'].is_staff:
        url = '/support/edit/admin/%s/' % str(ctx['support'].id)
        return HttpResponseRedirect(url)
    if ctx['user'] != ctx['support'].user:
        return render(request, 'no_edit.html', ctx)

    if ctx['support'].user == ctx['user']:
        if request.method == "POST":
            ctx['form'] = SupportForm(data=request.POST, files=request.FILES, instance=ctx['support'])
            if ctx['form'].is_valid():
                ctx['support'] = ctx['form'].save(commit=False)
                ctx['support'].last_modified_by = ctx['user'].username
                ctx['support'].save()
                url = '/support/show/%s/' % str(ctx['support'].id)
                return HttpResponseRedirect(url)
        else:
            ctx['form'] = SupportForm(instance=ctx['support'])
    else:
        ctx['url'] = '/accounts/not_authorized/'

    return render(request, 'edit/edit.html', ctx)


@login_required
def edit_support_admin(request, obj_id):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'title': "Update Support", 'support': Support.objects.get(id=obj_id)}

    if ctx['user'].is_staff:
        pass
    else:
        return render(request, 'no_edit.html', ctx)

    if ctx['support'].user == ctx['user']:
        if request.method == "POST":
            ctx['form'] = SupportAdminForm(data=request.POST, files=request.FILES, instance=ctx['support'])
            if ctx['form'].is_valid():
                ctx['support'] = ctx['form'].save(commit=False)

                ctx['support'].last_modified_by = ctx['user'].username
                ctx['support'].save()

                url = '/support/show/%s/' % str(ctx['support'].id)
                return HttpResponseRedirect(url)
        else:
            ctx['form'] = SupportAdminForm(instance=ctx['support'])
    else:
        ctx['url'] = '/accounts/not_authorized/'

    return render(request, 'edit.html', ctx)


@login_required
def delete_support(request, obj_id):
    """TODO Add docstring."""
    user = request.user
    support = get_object_or_404(Support, id=obj_id)
    if support.user == user or user.is_staff:
        support.delete()

    url = '/support/list/'
    return HttpResponseRedirect(url)


@login_required
def list_supports(request):
    """TODO Add docstring."""
    user = request.user
    title = "Support List"
    supports = Support.objects.filter(is_closed="N")
    return render(request, 'list/list_support_issues.html', {'user': user, 'title': title, 'supports': supports})


@login_required
@never_cache
def show_support(request, obj_id):
    """TODO Add docstring."""
    user = request.user
    obj = get_object_or_404(Support, id=obj_id)
    title = "Show Support"
    return render(request, 'show/show_support.html', {'user': user, 'obj': obj, 'title': title})


def search_support(request):
    """TODO Add docstring."""
    title = "Search For Support - With Results Shown"
    return render(request, 'list/list_support_issues.html', {'title': title})


@login_required
def search_support_for_last_30(request):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'query': Q(), 'query_show': 'Support Requests Received For Last 30 Days',
           'title': "Support Requests Received Last 30 Days - With Results Shown",
           'date': datetime.today() - timedelta(days=30)}
    if ctx['user'].is_staff:
        ctx['query'] = Q(created__gte=ctx['date'])
    else:
        ctx['query'] = Q(created__gte=ctx['date']) & Q(user=ctx['user'])

    if ctx['query']:
        ctx['the_count'] = Support.objects.filter(ctx['query']).count()
        ctx['objs'] = Support.objects.filter(ctx['query'])
    else:
        ctx['objs'] = ""

    return render(request, 'list/list_support_issues.html', ctx)


@login_required
def search_support_for_last_60(request):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'query': Q(), 'query_show': 'Support Requests Received For Last 60 Days',
           'title': "Support Requests Received Last 60 Days - With Results Shown",
           'date': datetime.today() - timedelta(days=60)}
    if ctx['user'].is_staff:
        ctx['query'] = Q(created__gte=ctx['date'])
    else:
        ctx['query'] = Q(created__gte=ctx['date']) & Q(user=ctx['user'])

    if ctx['query']:
        ctx['the_count'] = Support.objects.filter(ctx['query']).count()
        ctx['objs'] = Support.objects.filter(ctx['query'])
    else:
        ctx['objs'] = ""

    return render(request, 'list/list_support_issues.html', ctx)


@login_required
def search_support_for_last_90(request):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'query': Q(), 'query_show': 'Support Requests Received For Last 90 Days',
           'title': "Support Requests Received Last 90 Days - With Results Shown",
           'date': datetime.today() - timedelta(days=90)}
    if ctx['user'].is_staff:
        ctx['query'] = Q(created__gte=ctx['date'])
    else:
        ctx['query'] = Q(created__gte=ctx['date']) & Q(user=ctx['user'])

    if ctx['query']:
        ctx['the_count'] = Support.objects.filter(ctx['query']).count()
        ctx['objs'] = Support.objects.filter(ctx['query'])
    else:
        ctx['objs'] = ""

    return render(request, 'list/list_support_issues.html', ctx)


@login_required
def search_support_for_last_180(request):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'query': Q(), 'query_show': 'Support Requests Received For Last 180 Days',
           'title': "Support Requests Received Last 180 Days - With Results Shown",
           'date': datetime.today() - timedelta(days=180)}
    if ctx['user'].is_staff:
        ctx['query'] = Q(created__gte=ctx['date'])
    else:
        ctx['query'] = Q(created__gte=ctx['date']) & Q(user=ctx['user'])

    if ctx['query']:
        ctx['the_count'] = Support.objects.filter(ctx['query']).count()
        ctx['objs'] = Support.objects.filter(ctx['query'])
    else:
        ctx['objs'] = ""

    return render(request, 'list/list_support_issues.html', ctx)


@login_required
def create_support_type(request):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'title': "Create a New SupportType", 'support_types': SupportType.objects.all()}

    if request.method == "POST":
        ctx['form'] = SupportTypeForm(data=request.POST, files=request.FILES)
        if ctx['form'].is_valid():
            if 'files' in request.FILES:
                ctx['files'] = request.FILES['files']
                ctx['files'].user = ctx['user']

            ctx['support_type'] = ctx['form'].save(commit=False)

            ctx['support_type'].user = ctx['user']
            ctx['support_type'].created_by = ctx['user'].username
            ctx['support_type'].last_modified_by = ctx['user'].username
            ctx['support_type'].save()

            url = '/support/type/show/%s/' % str(ctx['support_type'].id)
            return HttpResponseRedirect(url)
    else:
        ctx['form'] = SupportTypeForm()
    return render(request, 'create/create.html', ctx)


@login_required
def edit_support_type(request, obj_id):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'title': "Update SupportType", 'support_type': SupportType.objects.get(id=obj_id),
           'support_types': SupportType.objects.all()}
    if ctx['user'].is_staff or ctx['user'] == ctx['support_type'].user:
        pass
    else:
        return render(request, 'no_edit.html', ctx)

    if ctx['support_type'].user == ctx['user']:
        if request.method == "POST":
            ctx['form'] = SupportTypeForm(data=request.POST, files=request.FILES, instance=ctx['support_type'])
            if ctx['form'].is_valid():
                ctx['support_type'] = ctx['form'].save(commit=False)
                ctx['support_type'].last_modified_by = ctx['user'].username
                ctx['support_type'].save()
                url = '/support/type/show/%s/' % str(ctx['support_type'].id)
                return HttpResponseRedirect(url)
        else:
            ctx['form'] = SupportTypeForm(instance=ctx['support_type'])
    else:
        ctx['url'] = '/accounts/not_authorized/'

    return render(request, 'edit/edit.html', ctx)


@login_required
def delete_support_type(request, obj_id):
    """TODO Add docstring."""
    user = request.user
    support_type = get_object_or_404(SupportType, id=obj_id)

    if support_type.user == user:
        support_type.delete()

    url = '/support/type/list/'
    return HttpResponseRedirect(url)


@login_required
def list_support_types(request):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'title': "SupportType List",
           'support_types': SupportType.objects.all().order_by('ordering')}
    return render(request, 'list/list_support_types.html', ctx)


@login_required
@never_cache
def show_support_type(request, obj_id):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'obj': get_object_or_404(SupportType, id=obj_id), 'title': "Show SupportType",
           'support_types': SupportType.objects.all().order_by('ordering')}
    return render(request, 'show/show.html', ctx)


def search_support_type(request):
    """TODO Add docstring."""
    title = "Search For SupportType - With Results Shown"
    return render(request, 'main/search_support_type.html', {'title': title})


@login_required
def create_priority(request):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'title': "Create a New Priority", 'priorities': Priority.objects.all()}

    if request.method == "POST":
        ctx['form'] = PriorityForm(data=request.POST, files=request.FILES)
        if ctx['form'].is_valid():
            if 'files' in request.FILES:
                ctx['files'] = request.FILES['files']
                ctx['files'].user = ctx['user']

            ctx['priority'] = ctx['form'].save(commit=False)

            ctx['priority'].user = ctx['user']
            ctx['priority'].created_by = ctx['user'].username
            ctx['priority'].last_modified_by = ctx['user'].username
            ctx['priority'].save()

            url = '/support/priority/show/%s/' % str(ctx['priority'].id)
            return HttpResponseRedirect(url)
    else:
        ctx['form'] = PriorityForm()
    return render(request, 'create_office.html', ctx)


@login_required
def edit_priority(request, obj_id):
    """TODO Add docstring."""
    ctx = {'user': request.user, 'title': "Update Priority", 'priority': Priority.objects.get(id=obj_id),
           'priorities': Priority.objects.all()}

    if ctx['user'].is_staff or ctx['user'] == ctx['priority'].user:
        pass
    else:
        return render(request, 'no_edit.html', ctx)

    if ctx['priority'].user == ctx['user']:
        if request.method == "POST":
            ctx['form'] = PriorityForm(data=request.POST, files=request.FILES, instance=ctx['priority'])
            if ctx['form'].is_valid():
                ctx['priority'] = ctx['form'].save(commit=False)

                ctx['priority'].last_modified_by = ctx['user'].username
                ctx['priority'].save()

                url = '/support/priority/show/%s/' % str(ctx['priority'].id)
                return HttpResponseRedirect(url)
        else:
            ctx['form'] = PriorityForm(instance=ctx['priority'])
    else:
        ctx['url'] = '/accounts/not_authorized/'

    return render(request, 'edit_office.html', ctx)


@login_required
def delete_priority(request, obj_id):
    """TODO Add docstring."""
    user = request.user
    priority = get_object_or_404(Priority, id=obj_id)
    if priority.user == user:
        priority.delete()

    url = '/support/priority/list/'
    return HttpResponseRedirect(url)


@login_required
def list_priorities(request):
    """TODO Add docstring."""
    user = request.user
    title = "Priority List"
    priorities = Priority.objects.all().order_by('ordering')
    return render(request, 'list/list_priorities.html', {'user': user, 'title': title, 'priorities': priorities})


@login_required
@never_cache
def show_priority(request, obj_id):
    """TODO Add docstring."""
    user = request.user
    obj = get_object_or_404(Priority, id=obj_id)
    title = "Show Priority"
    return render(request, 'show/show.html', {'user': user, 'obj': obj, 'title': title})


def search_priority(request):
    """TODO Add docstring."""
    title = "Search For Priority - With Results Shown"
    return render(request, 'main/search_priority.html', {'title': title})
