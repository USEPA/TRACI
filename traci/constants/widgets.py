# widgets.py (constants)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Defines custom widgets to be shared across any EPA Django apps.

Available widgets:
- ListTextWidget allows the user to select from a dropdown or optionally enter an option as free text.
"""

from django import forms

# https://stackoverflow.com/questions/24783275/django-form-with-choices-but-also-with-freetext-option
class ListTextWidget(forms.TextInput):
    """Custom widget to allow a user to select a dropdown option, or type in a custom option."""
    def __init__(self, data_list, name, *args, **kwargs):
        super(ListTextWidget, self).__init__(*args, **kwargs)
        self._name = name
        self._list = data_list
        self.attrs.update({'list':'list__%s' % self._name})

    def render(self, name, value, attrs=None, renderer=None):
        text_html = super(ListTextWidget, self).render(name, value, attrs=attrs)
        data_list = '<datalist id="list__%s">' % self._name
        for item in self._list:
            data_list += '<option value="%s">' % item
        data_list += '</datalist>'

        return text_html + data_list
