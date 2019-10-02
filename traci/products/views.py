# views.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""Definition of Products views."""

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
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.generic import TemplateView, ListView, UpdateView, CreateView, DetailView, \
    DeleteView
from products.forms import ProductForm, LifeCycleStageForm
from products.models import Product
from projects.models import Project

# Create your views here.


class ProductListView(ListView):
    """View for viewing, editing, and creating Products."""
    model = Product
    context_object_name = 'products_list'
    queryset = Product.objects.all()
    template_name = 'product_index.html'


class ProductDetailView(DetailView):
    """View for presenting product details."""
    model = Product
    template_name = 'product_detail.html'

    #def get_context_data(self, **kwargs):
    #    context = super().get_context_data(**kwargs)
    #    context['now'] = timezone.now()
    #    return context


# TODO update this based on the Createview found:
# https://docs.djangoproduct.com/en/2.2/ref/class-based-views/generic-editing/
class ProductCreateView(CreateView):
    """View for creating a new Product."""

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form for creating a new Product."""
        # TODO find project_id passed in here.
        project_id = request.GET.get('project_id', )
        project = Project.objects.get(id=project_id)
        form = ProductForm({'project': project})
        ctx = {'form': form, 'project_id': project_id}
        return render(request, "product_create.html", ctx)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new Product form filled out."""
        form = ProductForm(request.POST)
        if form.is_valid():
            product_obj = form.save(commit=True)
            return HttpResponseRedirect('/products/detail/' + str(product_obj.id))
        return render(request, "product_create.html", {'form': form})


class LifeCycleStageCreateView(CreateView):
    """View for creating a new Life Cycle Stage."""

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form for creating a new Product."""
        product_id = request.GET.get('product_id', )
        ctx = {'form': ProductForm(), 'product_id': product_id}
        return render(request, "create_lifecyclestage.html", ctx)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new Product form filled out."""
        product_id = request.GET.get('product_id', )
        form = LifeCycleStageForm(request.POST)


class ProductEditView(UpdateView):
    """View for editing or viewing an existing Product."""
    model = Product
    form_class = ProductForm
    template_name = 'product_edit.html'

    def form_valid(self, form):
        """Product Edit Form validation."""
        self.object = form.save(commit=False)
        self.object.save()
        return HttpResponseRedirect('/products/products/')


class ProductDeleteView(DeleteView):
    """View for deleting a product."""
    model = Product
    template_name = 'product_confirm_delete.html'
    #success_url = reverse_lazy('products')

    def get_success_url(self):
        project = self.object.project
        return  reverse_lazy('detail_project', kwargs={'pk': project.id})
