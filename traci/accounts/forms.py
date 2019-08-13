# forms.py (accounts)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Form used to manage user accounts.

Available functions:
- password resets
- update user profile
- create new user profile
"""

from django.contrib.auth.models import User
from django import forms
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.hashers import check_password, make_password
from accounts.models import Role, Sector, State, Country


class UsernameReminderRequestForm(forms.Form):
    """
    UsernameReminderRequestForm.

    Form to enter email when the user has  forgotten their username.
    """

    email = forms.CharField(label="Enter your email address", max_length=254,
                            required=True,
                            widget=forms.TextInput(
                                attrs={'class': 'form-control'}))


class PasswordResetRequestForm(forms.Form):
    """
    PasswordResetRequestForm.

    Form to enter username or email when a password reset is required.
    """

    email_or_username = forms.CharField(
        label="Enter your email address or username",
        max_length=254, required=True,
        widget=forms.TextInput(attrs={'class': 'form-control'}))


class SetPasswordForm(forms.Form):
    """
    SetPasswordForm.

    A form that lets a user change set their password without
    entering the old password.
    """

    new_password1 = forms.CharField(label="New password", required=True,
                                    widget=forms.PasswordInput(
                                        attrs={'class': 'form-control'}))
    new_password2 = forms.CharField(label="Confirm password", required=True,
                                    widget=forms.PasswordInput(
                                        attrs={'class': 'form-control'}))

    def clean_new_password2(self):
        """:return:."""
        password1 = self.cleaned_data.get('new_password1', )
        password2 = self.cleaned_data.get('new_password2', )
        if password1 and password2:
            if password1 != password2:
                raise forms.ValidationError(
                    "Please make sure the two password fields match.",
                    code='password_mismatch',
                )
        return password2


class ProfileUpdateForm(forms.ModelForm):
    """ProfileUpdateForm. Form to update."""

    username = forms.CharField(label=_("Username"),
                               widget=forms.TextInput(
                                   attrs={
                                       'class': 'form-control',
                                       'readonly': 'readonly'}))
    last_login = forms.DateTimeField(label=_("Last Login"),
                                     widget=forms.DateInput(
                                         format='%Y-%m-%d %I:%M:%S %Z',
                                         attrs={
                                             'class': 'form-control',
                                             'readonly': 'readonly'}))

    current_password = forms.CharField(label=_("Current Password"),
                                       widget=forms.PasswordInput(
                                           attrs={'class': 'form-control'}),
                                       required=False)
    password1 = forms.CharField(label=_("New Password"),
                                widget=forms.PasswordInput(
                                    attrs={'class': 'form-control'}),
                                required=False)
    password2 = forms.CharField(label=_("New Password confirmation"),
                                widget=forms.PasswordInput(
                                    attrs={'class': 'form-control'}),
                                help_text=_(
                                    "Enter the same password as above, for"
                                    "verification."),
                                required=False)

    first_name = forms.CharField(label=_("First name"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))
    last_name = forms.CharField(label=_("Last name"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))
    email = forms.CharField(label=_("Email address"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))

    affiliation = forms.CharField(label=_("Affiliation"),
                                  widget=forms.TextInput(
                                      attrs={'class': 'form-control'}))
    sector = forms.ModelChoiceField(label=_("Sector"),
                                    queryset=Sector.objects.all(),
                                    widget=forms.Select(
                                        attrs={'class': 'form-control'}),
                                    required=True)

    job_title = forms.CharField(label=_("Job Title"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))
    role = forms.ModelChoiceField(label=_("Role"), queryset=Role.objects.all(),
                                  widget=forms.Select(
                                      attrs={'class': 'form-control'}),
                                  required=True)

    address_line1 = forms.CharField(label=_("Address"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))
    address_line2 = forms.CharField(label=_("Address line 2"),
                                    widget=forms.TextInput(
                                        attrs={'class': 'form-control'}),
                                    required=False)
    city = forms.CharField(label=_("City"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))
    state = forms.ModelChoiceField(label=_("State"),
                                   queryset=State.objects.all(),
                                   required=False,
                                   widget=forms.Select(
                                       attrs={'class': 'form-control'}))
    zipcode = forms.CharField(label=_("Zipcode"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))
    country = forms.ModelChoiceField(label=_("Country"),
                                     queryset=Country.objects.all(),
                                     widget=forms.Select(
                                         attrs={'class': 'form-control'}))

    def clean(self):
        """Verify that state is set when country is USA."""
        state = self.cleaned_data.get('state', )
        country = self.cleaned_data.get('country', )
        if country.country == 'United States' and state is None or state == '':
            raise forms.ValidationError(
                "For locations in the United States, a state is required.")

    def __str__(self):
        """Request first name."""
        return str(self.first_name)

    def __init__(self, *args, **kw):
        """The __init__ method represents a constructor in Python."""
        super(ProfileUpdateForm, self).__init__(*args, **kw)
        profile = self.instance.userprofile
        self.fields['affiliation'].initial = profile.affiliation
        self.fields['sector'].initial = profile.sector
        self.fields['job_title'].initial = profile.job_title
        self.fields['role'].initial = profile.role
        self.fields['address_line1'].initial = profile.address_line1
        self.fields['address_line2'].initial = profile.address_line2
        self.fields['city'].initial = profile.city
        self.fields['state'].initial = profile.state
        self.fields['zipcode'].initial = profile.zipcode
        self.fields['country'].initial = profile.country

    class Meta:
        """User name fields required."""

        model = User
        fields = ('username', 'last_login', 'first_name', 'last_name', 'email')

    def clean_current_password(self):
        """Clean_current_password. Make sure current password is correct."""
        user = self.instance
        if self.cleaned_data["current_password"] and \
                not check_password(self.cleaned_data["current_password"],
                                   user.password):
            raise forms.ValidationError(
                _("The current password was incorrect. Please try again."))
        return self.cleaned_data["current_password"]

    def clean_password2(self):
        """Clean_password2. Verify that the new passwords match."""
        password1 = self.cleaned_data.get("password1", )
        password2 = self.cleaned_data["password2"]
        if password1 != password2:
            raise forms.ValidationError(_(
                "The passwords you entered did not match.  Please try again."))
        return password2

    def save(self, commit=True):
        """
        :param commit:
        :return:
        """
        user = self.instance
        user.first_name = self.cleaned_data["first_name"]
        user.last_name = self.cleaned_data["last_name"]
        user.userprofile.affiliation = self.cleaned_data["affiliation"]
        user.userprofile.sector = self.cleaned_data["sector"]
        user.userprofile.job_title = self.cleaned_data["job_title"]
        user.userprofile.role = self.cleaned_data["role"]
        # address
        user.userprofile.address_line1 = self.cleaned_data["address_line1"]
        user.userprofile.address_line2 = self.cleaned_data["address_line2"]
        user.userprofile.city = self.cleaned_data["city"]
        user.userprofile.state = self.cleaned_data["state"]
        user.userprofile.country = self.cleaned_data["country"]
        user.userprofile.zipcode = self.cleaned_data["zipcode"]
        # reset the passwords if specified
        new_password = self.cleaned_data["password2"]
        if new_password:
            user.password = make_password(new_password)

        user.userprofile.save()
        user.save()

        return user


class ProfileCreationForm(forms.ModelForm):
    """ProfileCreationForm. Form to create a new user profile."""

    username = forms.CharField(label=_("Username"),
                               widget=forms.TextInput(
                                   attrs={'class': 'form-control required'}),
                               max_length=255, required=True)
    password1 = forms.CharField(label=_("Password"),
                                widget=forms.PasswordInput(
                                    attrs={'class': 'form-control'}))
    password2 = forms.CharField(label=_("Password confirmation"),
                                widget=forms.PasswordInput(
                                    attrs={'class': 'form-control'}),
                                help_text=_(
                                    "Enter the same password as above, for"
                                    "verification."))

    first_name = forms.CharField(label=_("First name"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))
    last_name = forms.CharField(label=_("Last name"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))
    email = forms.CharField(label=_("Email address"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))

    affiliation = forms.CharField(label=_("Affiliation"),
                                  widget=forms.TextInput(
                                      attrs={'class': 'form-control'}))
    sector = forms.ModelChoiceField(label=_("Sector"),
                                    queryset=Sector.objects.all(),
                                    widget=forms.Select(
                                        attrs={'class': 'form-control'}),
                                    required=True)

    job_title = forms.CharField(label=_("Job Title"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))
    role = forms.ModelChoiceField(label=_("Role"), queryset=Role.objects.all(),
                                  widget=forms.Select(
                                      attrs={'class': 'form-control'}),
                                  required=True)

    address_line1 = forms.CharField(label=_("Address"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))
    address_line2 = forms.CharField(label=_("Address line 2"),
                                    widget=forms.TextInput(
                                        attrs={'class': 'form-control'}),
                                    required=False)
    city = forms.CharField(label=_("City"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))
    state = forms.ModelChoiceField(label=_("State"),
                                   queryset=State.objects.all(),
                                   widget=forms.Select(
                                       attrs={'class': 'form-control'}))
    zipcode = forms.CharField(label=_("Zipcode"), widget=forms.TextInput(
        attrs={'class': 'form-control'}))
    country = forms.ModelChoiceField(label=_("Country"),
                                     queryset=Country.objects.all(),
                                     widget=forms.Select(
                                         attrs={'class': 'form-control'}))

    def __str__(self):
        """Request first name."""
        return str(self.first_name)

    class Meta:
        """Username field."""

        model = User
        fields = ('username',)

    def clean_username(self):
        """
        :return:
        """
        username = self.cleaned_data["username"]
        try:
            User.objects.get(username=username)
        except User.DoesNotExist:
            return username
        raise forms.ValidationError(_(
            "The username you selected is already in use.  Please try a"
            "different username."))

    def clean_password2(self):
        """
        :return:
        """
        password1 = self.cleaned_data.get("password1", )
        password2 = self.cleaned_data["password2"]
        if password1 != password2:
            raise forms.ValidationError(_(
                "The passwords you entered did not match.  Please try again."))
        return password2

    def clean(self):
        """Verify that state and zipcode are set for US addresses."""
        state = self.cleaned_data.get('state', )
        zipcode = self.cleaned_data.get('zipcode', )
        country = self.cleaned_data.get('country', )
        if country.country == 'United States' and (
                state is None or state == '' or
                zipcode is None or zipcode == ''):
            msg = "This field is required for addresses in the United States"
            self.add_error('state', msg)
            self.add_error('zipcode', msg)

    def save(self, commit=True):
        """
        :param commit:
        :return:
        """
        user = User.objects.create_user(self.clean_username(),
                                        self.cleaned_data["email"],
                                        self.cleaned_data["password1"])
        user.first_name = self.cleaned_data["first_name"]
        user.last_name = self.cleaned_data["last_name"]
        user.is_active = False
        user.save()
        # User Profile.
        user.userprofile.affiliation = self.cleaned_data["affiliation"]
        user.userprofile.sector = self.cleaned_data["sector"]
        user.userprofile.job_title = self.cleaned_data["job_title"]
        user.userprofile.role = self.cleaned_data["role"]
        # Address.
        user.userprofile.address_line1 = self.cleaned_data["address_line1"]
        user.userprofile.address_line2 = self.cleaned_data["address_line2"]
        user.userprofile.city = self.cleaned_data["city"]
        user.userprofile.state = self.cleaned_data["state"]
        user.userprofile.country = self.cleaned_data["country"]
        user.userprofile.zipcode = self.cleaned_data["zipcode"]

        user.userprofile.save()

        return user
