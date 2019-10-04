# forms.py (products)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


"""Definition of forms."""

from django.forms import ModelForm, CharField, TextInput, ModelChoiceField, Select, FloatField, \
    NumberInput, IntegerField
from django.utils.translation import ugettext_lazy as _
from products.models import Product, LifeCycleStageName, LifeCycleStage, Process, Location, \
    ProcessName, Media, SubstanceType, Resource, Release
from projects.models import Project
from chemicals.models import Chemical, Unit


# New Product Form
class ProductForm(ModelForm):
    """
    Base form for creating a new product.
    """
    # Product Name
    name = CharField(
        max_length=255,
        widget=TextInput({'class': 'form-control mb-2',
                          'placeholder': 'Product Name'}),
        label=_("Product Name"), required=True)

    project = ModelChoiceField(queryset=Project.objects.all(), initial=0,
                               required=True, label=_("Parent Project"),
                               widget=TextInput(attrs={'class': 'form-control mb-2',
                                                       'readonly':'readonly'}))

    class Meta:
        """Meta data for Product form."""

        model = Product
        fields = ('name', 'project')


class LifeCycleStageForm(ModelForm):
    """
    Life Cycle Stages cross-reference with product, constitutes a single life cycle stage "entry" in a product.
    Each entry can have multiple instances of processes, manufacturing of a chemical for example.
    """

    name = ModelChoiceField(queryset=LifeCycleStageName.objects.all(),
                            initial=0, required=True,
                            label=_("Life Cycle Stage Type"),
                            widget=Select(attrs={'class': 'form-control mb-2'}))

    product = ModelChoiceField(queryset=Product.objects.all(), initial=0, required=True,
                               widget=TextInput(attrs={'class': 'form-control mb-2',
                                                       'readonly':'readonly'}))

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

    name = ModelChoiceField(queryset=ProcessName.objects.all(), initial=0, required=True,
                            label=_("Process Name"),
                            widget=Select(attrs={'class': 'form-control mb-2'}))
    # Hard coded to return all codes for states or regions.
    # TODO do geogid < 62 or <=61 instead of parent_id__in[60,61]
    location = ModelChoiceField(queryset=Location.objects.filter(geogid__lte=61).order_by('geogid'),
                                initial=0, required=True, label=_("Process Location (Parent - Required)"),
                                widget=Select(attrs={'class': 'form-control mb-2'}))
    # The child location will be used to narrow down past states or regions, if desired.
    child_location = ModelChoiceField(queryset=Location.objects.none(), initial=0, required=False,
                                label=_("Process Location (Child - Optional)"),
                                widget=Select(attrs={'class': 'form-control mb-2'}))
    lifecyclestage = ModelChoiceField(queryset=LifeCycleStage.objects.all(),
                                      initial=0, required=True, label=_("Parent Life Cycle Stage"),
                                      widget=TextInput(attrs={'class': 'form-control mb-2',
                                                              'readonly':'readonly'}))

    def __init__(self, *args, **kwargs):
        """
        This method is used to display a custom name, obj.name, instead of the stringified object view.
        """
        super(ProcessForm, self).__init__(*args, **kwargs)
        self.fields['name'].label_from_instance = lambda obj: "%s" % obj.name
        self.fields['location'].label_from_instance = lambda obj: "%s" % obj.name

    class Meta:
        """Meta data for Life Cycle Stage (Entry) form."""

        model = Process
        fields = ('name', 'location', 'lifecyclestage')


class SubstanceTypeForm(ModelForm):
    """
    This form will let the user choose a substance type, which will decide
    whether to use a ResourceForm or ReleaseForm for the rest of the flow.
    """
    substance_type = ModelChoiceField(queryset=SubstanceType.objects.all(), initial=0, required=True,
                                      label=_("Substance Type"),
                                      widget=Select(attrs={'class': 'form-control mb-2'}))

    def __init__(self, *args, **kwargs):
        """
        This method is used to display a custom name, obj.name, instead of the stringified object view.
        """
        super(SubstanceTypeForm, self).__init__(*args, **kwargs)
        self.fields['substance_type'].label_from_instance = lambda obj: "%s" % obj.name

    class Meta:
        """Meta data for SubstanceType form."""

        model = SubstanceType
        fields = ('substance_type',)


class ResourceForm(ModelForm):
    substance_type = ModelChoiceField(queryset=SubstanceType.objects.all(), initial=0, required=True,
                                      label=_("Name"),
                                      widget=Select(attrs={'class': 'form-control mb-2'}))
    resource_media = ModelChoiceField(queryset=Media.objects.filter(name='No Media'), initial=0, required=True,
                             label=_("Media"),
                             widget=Select(attrs={'class': 'form-control mb-2'}))
    resource_quantity = FloatField(label=_("Quantity"),
                          widget=NumberInput(attrs={'class': 'form-control mb-2'}),
                          required=True, initial=0)
    resource_unit = ModelChoiceField(queryset=Unit.objects.filter(chemical=False),
                            initial=0, required=True, label=_("Units of Measurement"),
                            widget=Select(attrs={'class': 'form-control mb-2'}))
    # Parent process reference, readonly
    process = ModelChoiceField(queryset=Process.objects.all(),
                               initial=0, required=True, label=_("Parent Process"),
                               widget=TextInput(attrs={'class': 'form-control mb-2',
                                                       'readonly':'readonly'}))

    def __init__(self, *args, **kwargs):
        """
        This method is used to display a custom name, obj.name, instead of the stringified object view.
        """
        super(ResourceForm, self).__init__(*args, **kwargs)
        self.fields['substance_type'].label_from_instance = lambda obj: "%s" % obj.name
        self.fields['resource_media'].label_from_instance = lambda obj: "%s" % obj.name
        self.fields['resource_unit'].label_from_instance = lambda obj: "%s" % obj.name

    class Meta:
        """Meta data for Resource form."""

        model = Resource
        fields = ('substance_type', 'resource_media', 'resource_quantity', 'resource_unit', 'process')



class ReleaseForm(ModelForm):
    chemical = ModelChoiceField(queryset=Chemical.objects.all(), initial=0,
                                required=True, label=_("Chemical Name"),
                                widget=TextInput(attrs={'class': 'form-control mb-2'}))
    release_media = ModelChoiceField(queryset=Media.objects.all().exclude(name='No Media'),
                             initial=0, required=True, label=_("Media"),
                             widget=Select(attrs={'class': 'form-control mb-2'}))
    release_quantity = FloatField(label=_("Quantity"),
                          widget=NumberInput(attrs={'class': 'form-control mb-2'}),
                          required=True, initial=0)
    release_unit = ModelChoiceField(queryset=Unit.objects.filter(chemical=True),
                            initial=0, required=True, label=_("Units of Measurement"),
                            widget=Select(attrs={'class': 'form-control mb-2'}))
    # Parent process reference, readonly
    process = ModelChoiceField(queryset=Process.objects.all(),
                               initial=0, required=True, label=_("Parent Process"),
                               widget=TextInput(attrs={'class': 'form-control mb-2',
                                                       'readonly':'readonly'}))

    def __init__(self, *args, **kwargs):
        """
        This method is used to display a custom name, obj.name, instead of the stringified object view.
        """
        super(ReleaseForm, self).__init__(*args, **kwargs)
        self.fields['chemical'].label_from_instance = lambda obj: "%s" % obj.name
        self.fields['release_media'].label_from_instance = lambda obj: "%s" % obj.name
        self.fields['release_unit'].label_from_instance = lambda obj: "%s" % obj.name

    class Meta:
        """Meta data for ReleaseForm form."""

        model = Release
        fields = ('chemical', 'release_media', 'release_quantity', 'release_unit', 'process')


#class ResourceReleaseForm(ModelForm):
#    """
#    Chemical Resources/Releases store the quantity and unit information pertaining to certain chemicals that
#    are either required inputs for a process, or the outputs of a process.
#    """

#    # Substance, Chemical Release, Land Use, Fossil Fuel, or Water Use
#    type = ModelChoiceField(queryset=Substance.objects.all(), initial=0, required=True,
#                            label=_("Resource/Release Type"),
#                            widget=Select(attrs={'class': 'form-control mb-2'}))
#    # Chemical/chemical
#    #chemical = IntegerField(required=True, label=_("Chemical"),
#    #                         widget=TextInput(attrs={'class': 'form-control mb-2'}))
#    #chemical = CharField(required=True, label=_("Chemical"),
#    #                      widget=TextInput(attrs={'class': 'form-control mb-2'}))
#    chemical = ModelChoiceField(queryset=Chemical.objects.all(), initial=0,
#                                 required=True, label=_("Chemical"),
#                                 widget=TextInput(attrs={'class': 'form-control mb-2'}))
#    #chemical = ModelChoiceField(queryset=Chemical.objects.all(), initial=0,
#    #                             required=True, label=_("Chemical"),
#    #                             widget=Select(attrs={'class': 'form-control mb-2'}))

#    # Media through which the Releases are output, null if Resource/Input.
#    media = ModelChoiceField(queryset=Media.objects.all(), initial=0, required=True,
#                             label=_("Medium"),
#                             widget=Select(attrs={'class': 'form-control mb-2'}))
#    # Parent process reference, readonly
#    process = ModelChoiceField(queryset=Process.objects.all(),
#                               initial=0, required=True, label=_("Parent Process"),
#                               widget=TextInput(attrs={'class': 'form-control mb-2',
#                                                       'readonly':'readonly'}))
#    quantity = FloatField(label=_("Quantity"),
#                          widget=NumberInput(attrs={'class': 'form-control mb-2'}),
#                          required=True, initial=0)
#    # Only pull chemical units first, then if the user selects an input type, then get the appropriate unit options
#    unit = ModelChoiceField(queryset=Unit.objects.filter(chemical_unit=True),
#                            initial=0, required=True, label=_("Units of Measurement"),
#                            widget=Select(attrs={'class': 'form-control mb-2'}))

#    def __init__(self, *args, **kwargs):
#        """
#        This method is used to display a custom name, obj.name, instead of the stringified object view.
#        """
#        super(ResourceReleaseForm, self).__init__(*args, **kwargs)
#        self.fields['type'].label_from_instance = lambda obj: "%s (%s)" % (obj.name, obj.type)
#        #self.fields['chemical'].label_from_instance = lambda obj: "%s" % obj.name
#        self.fields['media'].label_from_instance = lambda obj: "%s" % obj.name
#        #self.fields['process'].label_from_instance = lambda obj: "%s" % obj.name
#        self.fields['unit'].label_from_instance = lambda obj: "%s" % obj.name

#    class Meta:
#        """Meta data for Chemical Resource/Release form."""

#        model = ResourceRelease
#        fields = ('type', 'chemical', 'media', 'process', 'quantity', 'unit')
