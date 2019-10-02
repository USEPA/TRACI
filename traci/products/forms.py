# forms.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of forms."""

from django.forms import ModelForm, CharField, FloatField, TextInput, IntegerField, NumberInput, \
    ModelChoiceField, Select
from django.utils.translation import ugettext_lazy as _
from products.models import Product, LifeCycleStage, LifeCycleStageEntry
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


class LifeCycleStageEntryForm(ModelForm):
    """
    Life Cycle Stages cross-reference with product, constitutes a single life cycle stage "entry" in a product.
    Each entry can have multiple instances of processes, manufacturing of a substance for example.
    """

    lifecyclestage = ModelChoiceField(queryset=LifeCycleStage.objects.all(), initial=0, required=True,
                                      label=_("Life Cycle Stage Type"),
                                      widget=Select(attrs={'class': 'form-control mb-2'}))

    product = ModelChoiceField(queryset=Product.objects.all(), initial=0, required=True,
                               widget=TextInput(attrs={'class': 'form-control mb-2', 'readonly':'readonly'}))
    
    def __init__(self, *args, **kwargs):
        """This method is used to display a custom name, obj.name, instead of the stringified object view"""
        super(LifeCycleStageEntryForm, self).__init__(*args, **kwargs)
        self.fields['lifecyclestage'].label_from_instance = lambda obj: "%s" % obj.name

    class Meta:
        """Meta data for Life Cycle Stage (Entry) form."""

        model = LifeCycleStageEntry
        fields = ('lifecyclestage', 'product')
