# views.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""Definition of Products views."""

from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse_lazy
from django.utils.decorators import method_decorator
from django.views.generic import ListView, UpdateView, CreateView, DetailView, DeleteView
from products.forms import ProductForm, LifeCycleStageForm, ProcessForm, SubstanceTypeForm, \
    ResourceForm, ReleaseForm
from products.models import Product, LifeCycleStage, Process, ProcessName, Release, Resource
from projects.models import Project
from chemicals.models import Chemical

# Create your views here.


class ProductListView(ListView):
    """View for viewing, editing, and creating Products."""
    model = Product
    context_object_name = 'products_list'
    queryset = Product.objects.all()
    template_name = 'product/product_index.html'


class ProductDetailView(DetailView):
    """View for presenting product details."""
    model = Product
    template_name = 'product/product_detail.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['stages_list'] = LifeCycleStage.objects.filter(product=context['object'])
        return context


class ProductCreateView(CreateView):
    """View for creating a new Product."""

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form for creating a new Product."""
        project_id = request.GET.get('project_id', )
        project = Project.objects.get(id=project_id)
        form = ProductForm({'project': project})
        ctx = {'form': form, 'project_id': project_id}
        return render(request, "product/product_create.html", ctx)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new Product form filled out."""
        form = ProductForm(request.POST)
        if form.is_valid():
            product_obj = form.save(commit=True)
            return HttpResponseRedirect('/products/detail/' + str(product_obj.id))
        return render(request, "product/product_create.html", {'form': form})


class ProductEditView(UpdateView):
    """View for editing or viewing an existing Product."""
    model = Product
    form_class = ProductForm
    template_name = 'product/product_edit.html'

    def form_valid(self, form):
        """Product Edit Form validation and redirect."""
        self.object = form.save(commit=False)
        self.object.save()
        return HttpResponseRedirect('/products/detail/' + str(self.object.id))


class ProductDeleteView(DeleteView):
    """View for deleting a product."""
    model = Product
    template_name = 'product/product_confirm_delete.html'

    def get_success_url(self):
        project = self.object.project
        return  reverse_lazy('detail_project', kwargs={'pk': project.id})


# Life Cycle Stage section
class LifeCycleStageCreateView(CreateView):
    """View for creating a new Life Cycle Stage."""

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form for creating a new Product."""
        product_id = request.GET.get('product_id', )
        product = Product.objects.get(id=product_id)
        form = LifeCycleStageForm({'product': product})
        ctx = {'form': form, 'product_id': product_id}
        return render(request, "lifecyclestage/lifecyclestage_create.html", ctx)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new LifeCycleStageName form filled out."""
        form = LifeCycleStageForm(request.POST)
        if form.is_valid():
            lifecyclestage_obj = form.save(commit=True)
            return HttpResponseRedirect('/products/lifecyclestage/detail/' + str(lifecyclestage_obj.id))
        return render(request, "lifecyclestage/lifecyclestage_create.html", {'form': form})


class LifeCycleStageEditView(UpdateView):
    """View for editing a life cycle stage entry for a LifeCycleStageName"""
    model = LifeCycleStage
    form_class = LifeCycleStageForm
    template_name = 'lifecyclestage/lifecyclestage_edit.html'

    def form_valid(self, form):
        """LifeCycleStage Edit Form validation and redirect."""
        self.object = form.save(commit=False)
        self.object.save()
        return HttpResponseRedirect('/products/lifecyclestage/detail/' + str(self.object.id))


class LifeCycleStageDetailView(DetailView):
    """View for viewing the details of a life cycle stage entry for a product"""
    model = LifeCycleStage
    template_name = 'lifecyclestage/lifecyclestage_detail.html'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['process_list'] = Process.objects.filter(lifecyclestage=context['object'])
        return context


class LifeCycleStageDeleteView(DeleteView):
    """View for removing a life cycle stage entry from a product"""
    model = LifeCycleStage
    template_name = 'lifecyclestage/lifecyclestage_confirm_delete.html'

    def get_success_url(self):
        product = self.object.product
        return  reverse_lazy('detail_product', kwargs={'pk': product.id})


# Process section
class ProcessCreateView(CreateView):
    """View for creating a new Process for a life cycle stage."""

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form for creating a new Process."""
        stage_id = request.GET.get('lifecyclestage_id', )
        lifecyclestage = LifeCycleStage.objects.get(id=stage_id)
        # TODO pass in the existing list of process names as data_list
        #process_names = list(ProcessName.objects.values_list('name', flat=True))
        #form = ProcessForm({'data_list': process_names, 'lifecyclestage': lifecyclestage})
        form = ProcessForm({'lifecyclestage': lifecyclestage})
        ctx = {'form': form, 'lifecyclestage_id': stage_id}
        return render(request, "process/process_create.html", ctx)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new Process form filled out."""
        p_name = request.POST.get('name')
        if p_name and not ProcessName.objects.filter(name=p_name).exists():
            # Some way to denote if the name is user defined? Check to see if the name passed is an id
            # If it is an id, then it's not user defined, it's already existing.
            try:
                name_id = int(p_name)
            except ValueError:
                process_name = ProcessName.objects.create(name=p_name)
                # Reassign the name in POST so it reflects the new name ID instead of the name name
                request.POST = request.POST.copy()
                request.POST['name'] = process_name.id

        form = ProcessForm(request.POST)
        if form.is_valid():
            process_obj = form.save(commit=True)
            return HttpResponseRedirect('/products/process/detail/' + str(process_obj.id))
        return render(request, "process/process_create.html", {'form': form})


class ProcessEditView(UpdateView):
    """View for editing a process for a life cycle stage"""
    model = Process
    form_class = ProcessForm
    template_name = 'process/process_edit.html'

    def form_valid(self, form):
        """Process Edit Form validation and redirect."""
        self.object = form.save(commit=False)
        self.object.save()
        return HttpResponseRedirect('/products/process/detail/' + str(self.object.id))


class ProcessDetailView(DetailView):
    """View for viewing the details of a process for a life cycle stage"""
    model = Process
    template_name = 'process/process_detail.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['release_list'] = Release.objects.filter(process=context['object'])
        context['resource_list'] = Resource.objects.filter(process=context['object'])
        return context


class ProcessDeleteView(DeleteView):
    """View for removing a process from a Life Cycle Stage Entry"""
    model = Process
    template_name = 'process/process_confirm_delete.html'

    def get_success_url(self):
        stage = self.object.lifecyclestage
        return  reverse_lazy('detail_lifecyclestage', kwargs={'pk': stage.id})


# ResourceRelease section
class ResourceReleaseCreateView(CreateView):
    """View for creating a new ResourceRelease for a life cycle stage."""

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form for creating a new ResourceRelease."""
        process_id = request.GET.get('process_id', )
        process = Process.objects.get(id=process_id)
        form = SubstanceTypeForm()
        resource_form = ResourceForm({'process': process})
        release_form = ReleaseForm({'process': process})
        ctx = {'form': form, 'resource_form': resource_form,
               'release_form': release_form, 'process_id': process_id}
        return render(request, "resourcerelease/resourcerelease_create.html", ctx)

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new ResourceRelease form filled out."""
        # This post could contain either a Release or a Resource form.
        # Figure out which was passed in based on the presence of substance_type vs chemical

        form = SubstanceTypeForm(request.POST)
        if form.is_valid():
            # To support the model select form integrating with our custom chemical search box,
            # we have to do some dirty code. Otherwise, the form won't validate
            chemical_name = request.POST.get('chemical', '');
            if chemical_name:
                # Retrieve a queryset that contains the selected chemical
                queryset = Chemical.objects.filter(name=chemical_name)
                chemical = queryset.first()
                # Overwrite the POST data so the susbtance reflects its ID instead of name
                request.POST = request.POST.copy()
                request.POST['chemical'] = chemical.id

                release_form = ReleaseForm(request.POST)
                # Overwrite the form chemical choices with our queryset from above
                release_form.fields['chemical'].choices.queryset = queryset

                if release_form.is_valid():
                    release_obj = release_form.save(commit=True)
                    return HttpResponseRedirect('/products/process/detail/' + str(release_obj.process.id))

            resource_form = ResourceForm(request.POST)
            if resource_form.is_valid():
                resource_obj = resource_form.save(commit=True)
                return HttpResponseRedirect('/products/process/detail/' + str(resource_obj.process.id))
        
        return render(request, "resourcerelease/resourcerelease_create.html", {'form': form})


class ReleaseEditView(UpdateView):
    """View for editing a Release for a life cycle stage"""
    model = Release
    form_class = ReleaseForm
    template_name = 'resourcerelease/resourcerelease_edit.html'

    def form_valid(self, form):
        """Release Edit Form validation and redirect."""
        self.object = form.save(commit=False)
        self.object.save()
        return HttpResponseRedirect('/products/process/detail/' + str(self.object.process.id))


class ResourceEditView(UpdateView):
    """View for editing a Resource for a life cycle stage"""
    model = Resource
    form_class = ResourceForm
    template_name = 'resourcerelease/resourcerelease_edit.html'

    def form_valid(self, form):
        """Resource Edit Form validation and redirect."""
        self.object = form.save(commit=False)
        self.object.save()
        return HttpResponseRedirect('/products/process/detail/' + str(self.object.process.id))


#class ResourceReleaseDeleteView(DeleteView):
#    """View for removing a process from a Life Cycle Stage Entry"""
#    model = ResourceRelease
#    template_name = 'resourcerelease/resourcerelease_confirm_delete.html'

#    def get_success_url(self):
#        process = self.object.process
#        return  reverse_lazy('detail_process', kwargs={'pk': process.id})


class ReleaseDeleteView(DeleteView):
    """View for removing a Release from a Life Cycle Stage Entry"""
    model = Release
    template_name = 'resourcerelease/resourcerelease_confirm_delete.html'

    def get_success_url(self):
        process = self.object.process
        return  reverse_lazy('detail_process', kwargs={'pk': process.id})


class ResourceDeleteView(DeleteView):
    """View for removing a Resource from a Life Cycle Stage Entry"""
    model = Resource
    template_name = 'resourcerelease/resourcerelease_confirm_delete.html'

    def get_success_url(self):
        process = self.object.process
        return  reverse_lazy('detail_process', kwargs={'pk': process.id})