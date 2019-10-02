# forms.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of forms."""

from django.forms import ModelForm, CharField, FloatField, TextInput, IntegerField, NumberInput, ModelChoiceField
from django.utils.translation import ugettext_lazy as _
from products.models import Product
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
    project = ModelChoiceField(queryset=Project.objects.all(), initial=0, required=True,
                               widget=TextInput(attrs={'class': 'form-control mb-2', 'readonly':'readonly'}))
    #project_id = IntegerField(
    #    widget=NumberInput({'class': 'form-control mb-2', 'readonly': 'readonly'}),
    #    required=True, label=_("Parent Project"))

    class Meta:
        """Meta data for Product form."""

        model = Product
        fields = ('name', 'project')


class LifeCycleStageForm(ModelForm):
    """
    Life Cycle Stages, the database entries for this will not change.
    There are six static options.
    """
    name = CharField(
        max_length=255,
        widget=TextInput({'class': 'form-control mb-2', 'placeholder': 'Life Cycle Stage Name'}),
        label=_("Life Cycle Stage Name"), required=True)
