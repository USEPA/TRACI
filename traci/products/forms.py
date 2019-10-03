# forms.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of forms."""

from django.forms import ModelForm, CharField, TextInput, \
    ModelChoiceField, Select
from django.utils.translation import ugettext_lazy as _
from products.models import Product, LifeCycleStageName, LifeCycleStage, Process, Location, ProcessName
from projects.models import Project


# New Product Form
class ProductForm(ModelForm):
    """
    Base form for creating a new product.
    """
    # Product Name
    name = CharField(
        max_length=255,
        widget=TextInput({'class': 'form-control mb-2', 'placeholder': 'Product Name'}),
        label=_("Product Name"), required=True)

    project = ModelChoiceField(queryset=Project.objects.all(), initial=0, required=True, label=_("Project"),
                               widget=TextInput(attrs={'class': 'form-control mb-2', 'readonly':'readonly'}))

    class Meta:
        """Meta data for Product form."""

        model = Product
        fields = ('name', 'project')


class LifeCycleStageForm(ModelForm):
    """
    Life Cycle Stages cross-reference with product, constitutes a single life cycle stage "entry" in a product.
    Each entry can have multiple instances of processes, manufacturing of a substance for example.
    """

    name = ModelChoiceField(queryset=LifeCycleStageName.objects.all(), initial=0, required=True,
                            label=_("Life Cycle Stage Type"),
                            widget=Select(attrs={'class': 'form-control mb-2'}))

    product = ModelChoiceField(queryset=Product.objects.all(), initial=0, required=True,
                               widget=TextInput(attrs={'class': 'form-control mb-2', 'readonly':'readonly'}))

    def __init__(self, *args, **kwargs):
        """This method is used to display a custom name, obj.name, instead of the stringified object view"""
        super(LifeCycleStageForm, self).__init__(*args, **kwargs)
        self.fields['name'].label_from_instance = lambda obj: "%s" % obj.name

    class Meta:
        """Meta data for Life Cycle Stage (Entry) form."""

        model = LifeCycleStage
        fields = ('name', 'product')


class ProcessForm(ModelForm):
    """
    TODO
    """

    #name = CharField(required=True)
    name = ModelChoiceField(queryset=ProcessName.objects.all(), initial=0, required=True,
                            label=_("Process Name"),
                            widget=Select(attrs={'class': 'form-control mb-2'}))
    # Hard coded to return all codes for states or regions.
    location = ModelChoiceField(queryset=Location.objects.filter(parent_id__in=[60,61]).order_by('geogid'),
                                initial=0, required=True, label=_("Process Location (Parent - Required)"),
                                widget=Select(attrs={'class': 'form-control mb-2'}))
    # The child location will be used to narrow down past states or regions, if desired.
    child_location = ModelChoiceField(queryset=Location.objects.none(), initial=0, required=False,
                                label=_("Process Location (Child - Optional)"),
                                widget=Select(attrs={'class': 'form-control mb-2'}))
    lifecyclestage = ModelChoiceField(queryset=LifeCycleStage.objects.all(),
                                      initial=0, required=True, label=_("Life Cycle Stage"),
                                      widget=TextInput(attrs={'class': 'form-control mb-2',
                                                              'readonly':'readonly'}))

    def __init__(self, *args, **kwargs):
        """
        This method is used to display a custom name, obj.name, instead of the stringified object view.
        It's additionally used to allow the user to select a name from a dropdown, or optionally enter a new name.
        """
        super(ProcessForm, self).__init__(*args, **kwargs)
        self.fields['name'].label_from_instance = lambda obj: "%s" % obj.name
        self.fields['location'].label_from_instance = lambda obj: "%s" % obj.name

    class Meta:
        """Meta data for Life Cycle Stage (Entry) form."""

        model = Process
        fields = ('name', 'location', 'lifecyclestage')
