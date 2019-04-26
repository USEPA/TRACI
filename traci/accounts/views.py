# views.py (accounts)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Views for managing user accounts and profiles.

Available functions:
- View forgotten username
- Reset password
- View user account
- Password reset process
"""

from urllib.parse import urlparse
from django.conf import settings
from django.db.models import Q

# Authorized login.
from django.contrib.auth import get_user_model
from django.contrib.auth.models import User
from django.contrib.auth import REDIRECT_FIELD_NAME, login as auth_login, \
    logout as auth_logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.tokens import default_token_generator
from django.contrib.sites.shortcuts import get_current_site

# Validation.
from django.core.validators import validate_email
from django.core.mail import send_mail
from django.http import HttpResponseRedirect
from django.forms import ValidationError
from django.shortcuts import render
from django.contrib import messages
from django.views.generic import FormView, TemplateView
from django.views.decorators.debug import sensitive_post_parameters
from django.views.decorators.csrf import csrf_protect
from django.views.decorators.cache import never_cache
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.decorators import method_decorator
from django.utils.encoding import force_bytes
from django.utils.translation import ugettext_lazy as _
from django.template import loader
from django.template.response import TemplateResponse
from accounts.forms import SetPasswordForm, ProfileUpdateForm, \
    UsernameReminderRequestForm, PasswordResetRequestForm, ProfileCreationForm
from accounts.models import State, Sector, Role, Country


class UsernameReminderRequestView(FormView):
    """View for forgotten username."""

    template_name = "registration/username_reminder.html"
    form_class = UsernameReminderRequestForm
    messages = None

    @staticmethod
    def validate_email_address(email):
        """
        :param email:
        :return:
        """
        try:
            validate_email(email)
            return True
        except ValidationError:
            return False

    def post(self, request, *args, **kwargs):
        """
        :param request:
        :param args:
        :param kwargs:
        :return:
        """

        form = self.form_class(request.POST)
        try:
            if form.is_valid():
                data = form.cleaned_data["email"]

            # uses the method written above
            if self.validate_email_address(data) is True:
                # find the users associated with this email
                associated_users = User.objects.filter(
                    Q(email=data) | Q(username=data))
                if associated_users.exists():
                    for user in associated_users:
                        content = {
                            'email': user.email,
                            'domain': request.META['HTTP_HOST'],
                            'site_name': settings.SITE_NAME,
                            'user': user,
                            'protocol': 'http'
                        }
                        subject_template_name = 'registration/username_reminder_subject.txt'
                        # Copied from django/contrib/admin/templates/registration/password_reset_subject.txt
                        # to templates directory.
                        email_template_name = 'registration/username_reminder_email.html'
                        # Copied from django/contrib/admin/templates/registration/password_reset_email.html
                        # to templates directory.
                        subject = loader.render_to_string(
                            subject_template_name, content)
                        # Email subject *must not* contain newlines.
                        subject = ''.join(subject.splitlines())
                        email = loader.render_to_string(
                            email_template_name, content)
                        send_mail(subject, email, settings.DEFAULT_FROM_EMAIL,
                                  [user.email], fail_silently=True)
                    # Render the done page.
                    return render(request,
                                  'registration/username_reminder_done.html',
                                  locals())

                result = self.form_invalid(form)
                messages.error(request,
                               'No user is associated with this email address')
                return result

            # Email is not valid.
            result = self.form_invalid(form)
            messages.error(request, 'Please enter a valid email address.')
            return result

        except BaseException as ex:
            print(ex)
        return self.form_invalid(form)


class PasswordResetRequestView(FormView):
    """
    View for starting the password reset process. This view renders the form
    to enter a username or email address. Upon successful entry of a user
    email, an email is sent with password reset instructions and a confirmation
    message displayed.
    """
    template_name = "registration/password_reset.html"
    form_class = PasswordResetRequestForm

    @staticmethod
    def validate_email_address(email):
        """
        :param email:
        :return:
        """
        try:
            validate_email(email)
            return True
        except ValidationError:
            return False

    def post(self, request, *args, **kwargs):
        """
        :param request:
        :param args:
        :param kwargs:
        :return:
        """
        form = self.form_class(request.POST)
        try:
            # Make sure the user entered something into the form.
            if form.is_valid():
                temp_data = form.cleaned_data["email_or_username"]
            else:
                result = self.form_invalid(form)
                messages.error(request,
                               'Please enter a valid email address or '
                               'username')
                return result

            # Determine if the email address or username matches an account.
            if self.validate_email_address(temp_data) is True:
                # User entered an email address.
                associated_users = User.objects.filter(
                    Q(email=temp_data) | Q(username=temp_data))
                if associated_users.exists() is False:
                    result = self.form_invalid(form)
                    messages.error(request,
                                   'No user is associated with this email '
                                   'address')
                    return result
            else:
                associated_users = User.objects.filter(username=temp_data)
                if associated_users.exists() is False:
                    result = self.form_invalid(form)
                    messages.error(request,
                                   'This username does not exist in the '
                                   'system.')
                    return result

            # Send an email to the user with a password reset token.
            for user in associated_users:
                content = {
                    'email': user.email,
                    'domain': request.META['HTTP_HOST'],
                    'site_name': settings.SITE_NAME,
                    'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                    'user': user,
                    'token': default_token_generator.make_token(user),
                    'protocol': 'http',
                }
                subject_template_name = \
                    'registration/password_reset_subject.txt'
                email_template_name = 'registration/password_reset_email.html'

                subject = loader.render_to_string(
                    subject_template_name, content)
                # Email subject *must not* contain newlines.
                subject = ''.join(subject.splitlines())
                email = loader.render_to_string(email_template_name, content)

                send_mail(subject, email, settings.DEFAULT_FROM_EMAIL,
                          [user.email], fail_silently=True)

            # Render the done page.
            return render(request,
                          'registration/password_reset_email_sent.html',
                          locals())

        except BaseException as ex:
            print(ex)
        return self.form_invalid(form)


class PasswordResetConfirmView(FormView):
    """
    This view handles the actual password reset for a user that has forgotten
    their password. The view first checks the hash in a password reset link
    and then presents a form to enter a new password.
    """
    template_name = "registration/password_reset_confirm.html"
    form_class = SetPasswordForm

    def get(self, request, uidb64=None, token=None):
        """
        Responds to link from password reset email
        """
        form = self.form_class(None)
        if uidb64 is None or token is None:
            return render(request, 'registration/password_reset_confirm_no_token.html', {'form': form})
        usermodel = get_user_model()

        try:
            uid = urlsafe_base64_decode(uidb64)
            user = usermodel._default_manager.get(pk=uid)
        except (TypeError, ValueError, OverflowError, usermodel.DoesNotExist):
            user = None

        if user is None or default_token_generator.check_token(user, token) is False:
            return render(request, 'registration/password_reset_confirm_no_token.html',
                          {'form': form, 'usermodel': usermodel, 'uid': uid})

        return render(request, 'registration/password_reset.html',
                      {'form': form, 'usermodel': usermodel, 'uid': uid, 'user': user})

    def post(self, request, uidb64=None, token=None, *arg, **kwargs):  # pylint: disable=keyword-arg-before-vararg
        """
        :param request:
        :param uidb64:
        :param token:
        :param arg:
        :param kwargs:
        :return:
        """
        form = self.form_class(request.POST)

        usermodel = get_user_model()
        assert uidb64 is not None and token is not None
        try:
            uid = urlsafe_base64_decode(uidb64)
            user = usermodel._default_manager.get(pk=uid)
        except (TypeError, ValueError, OverflowError, usermodel.DoesNotExist):
            user = None
        if user is not None and default_token_generator.check_token(user,
                                                                    token):
            if form.is_valid():
                new_password = form.cleaned_data['new_password2']
                user.set_password(new_password)
                user.save()

                return render(request, 'registration/password_reset_done.html', locals())

            messages.error(
                request, 'Password reset was unsuccessful. Please try again')
            return self.form_invalid(form)

        messages.error(request, 'The reset password link is no longer valid.')
        return self.form_invalid(form)


class ProfileView(FormView):
    """View of the user account information from the dashboard."""
    form_class = ProfileUpdateForm

    @method_decorator(login_required)
    def get(self, request, **kwargs):
        """
        Display the user profile.
        :param request:
        """
        form = ProfileUpdateForm(instance=request.user)
        return render(request, 'main/profile.html', {'form': form})

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Save the changes to the user form."""
        user = User.objects.get(username=request.user.username)
        form = self.form_class(request.POST, instance=user)
        if form.is_valid():
            # Save the user information and get a pointer to the User object.
            user = form.save()
        # If password info changed, make sure current password is correct.
        success = True

        return render(request, 'main/profile.html',
                      {'user': user, 'form': form, 'success': success})


class UserRegistrationView(FormView):
    """
    View for starting the password reset process. This view renders the form
    to enter a username or email address. Upon successful entry of a
    user/email, an email is sent with password reset instructions and a
    confirmation message displayed.
    """
    template_register = "registration/register.html"
    # email and subject line for the message sent to the GREENSCOPE admins
    admin_subject_template_name = 'registration/register_request_admin_subject.txt'
    admin_email_template_name = 'registration/register_request_admin_email.html'
    # email and subject line for the message sent to the potential GREENSCOPE user
    user_subject_template_name = 'registration/register_request_user_subject.txt'
    user_email_template_name = 'registration/register_request_user_email.html'
    form_class = ProfileCreationForm

    def get(self, request, *args, **kwargs):
        """Render the user registration template."""
        form = ProfileCreationForm()
        return render(request, self.template_register, {'form': form})

    def post(self, request, *args, **kwargs):
        """Process the user's registration request."""
        postdata = request.POST.copy()
        form = ProfileCreationForm(postdata)

        if form.is_valid():
            # Save the user information and get a pointer to the User object.
            user = form.save()

            # get values for the foreign key values
            role = Role.objects.get(id=user.userprofile.role_id)
            sector = Sector.objects.get(id=user.userprofile.sector_id)
            try:
                state = State.objects.get(id=user.userprofile.state_id)
            except BaseException:
                state = None
            country = Country.objects.get(id=user.userprofile.country_id)

            # Send an activation email.
            request_email_context = {
                'APP_NAME': settings.APP_NAME,
                'email': settings.EMAIL_HOST_USER,
                'domain': request.META['HTTP_HOST'],
                'site_name': settings.SITE_NAME,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)).decode(),
                'user': user,
                'sector': sector,
                'role': role,
                'state': state,
                'country': country,
                'protocol': 'http',
            }
            subject = loader.render_to_string(
                self.admin_subject_template_name, request_email_context)
            # Email subject *must not* contain newlines
            subject = ''.join(subject.splitlines())
            email = loader.render_to_string(
                self.admin_email_template_name, request_email_context)
            # this is driven by local_settings.py
            send_mail(subject, email, settings.DEFAULT_FROM_EMAIL,
                      settings.USER_APPROVAL_EMAIL, fail_silently=False)

            # send an email to the user notifying them that the account request is under review
            user_email_context = {
                'APP_NAME': settings.APP_NAME,
                'email': user.email
            }
            subject = loader.render_to_string(
                self.user_subject_template_name, user_email_context)
            # Email subject *must not* contain newlines
            subject = ''.join(subject.splitlines())
            email = loader.render_to_string(
                self.user_email_template_name, user_email_context)
            send_mail(subject, email, settings.DEFAULT_FROM_EMAIL,
                      [user.email], fail_silently=False)

            # render the activation needed template
            return render(request, self.template_register_inactive, locals())  # pylint: disable=no-member
        return render(request, self.template_register, locals())


class UserApprovalView(TemplateView):
    """
    View for activating a user.

    This view can only be accessed by an administrator.  Typically accessed
    from the registration request email sent to the gemm email address.
    """
    template_name = "registration/register_approved.html"
    template_name_no_uid = "registration/register_approved_no_uid.html"
    # email and subject line for approval email
    subject_template_name = 'registration/register_approved_subject.txt'
    email_template_name = 'registration/register_approved_email.html'

    @method_decorator(login_required)
    def get(self, request, uidb64=None):
        """Activate a user, given a valid token in the url."""
        if not request.user.is_superuser:
            return render(request, self.template_name_no_uid, locals())

        if uidb64 is None:
            return render(request, self.template_name_no_uid, locals())

        user_model = get_user_model()
        try:
            uid = urlsafe_base64_decode(uidb64)
            user = user_model._default_manager.get(pk=uid)
            user.is_active = True
            user.save()

            # notify the user
            user_email_context = {
                'APP_NAME': settings.APP_NAME,
                'email': user.email,
                'username': user.username,
                'protocol': 'http',
                'domain': request.META['HTTP_HOST']
            }

            subject = loader.render_to_string(
                self.subject_template_name, user_email_context)
            # Email subject *must not* contain newlines
            subject = ''.join(subject.splitlines())
            email = loader.render_to_string(
                self.email_template_name, user_email_context)
            send_mail(subject, email, settings.DEFAULT_FROM_EMAIL,
                      [user.email], fail_silently=False)

        except (TypeError, ValueError, OverflowError, user_model.DoesNotExist):
            user = None

        if user is None:
            return render(request, self.template_name_no_uid, locals())
        return render(request, self.template_name, locals())


class UserDenialView(TemplateView):
    """
    View for starting the password reset process.

    This view renders the form to enter a username or email address.
    Upon successful entry of a user/email, an email is sent with password reset instructions
    and a confirmation message displayed.
    """
    template_name = "registration/register_denied.html"
    template_name_no_uid = "registration/register_denied_no_uid.html"
    # email and subject line for denial message
    subject_template_name = 'registration/register_denied_subject.txt'
    email_template_name = 'registration/register_denied_email.html'

    @method_decorator(login_required)
    def get(self, request, uidb64=None):
        """Activate a user, given a valid token in the url."""
        if not request.user.is_superuser:
            return render(request, self.template_name_no_uid, locals())

        if uidb64 is None:
            return render(request, self.template_name_no_uid, locals())

        user_model = get_user_model()
        try:
            uid = urlsafe_base64_decode(uidb64)
            user = user_model._default_manager.get(pk=uid)
            username = user.username
            # notify the user of the denial
            context = {
                'APP_NAME': settings.APP_NAME,
                'username': username,
            }
            subject = loader.render_to_string(
                self.subject_template_name, context)
            # Email subject *must not* contain newlines
            subject = ''.join(subject.splitlines())
            email = loader.render_to_string(self.email_template_name, context)
            send_mail(subject, email, settings.DEFAULT_FROM_EMAIL,
                      [user.email], fail_silently=False)

            # delete the account
            user.delete()
            return render(request, self.template_name, locals())

        except (TypeError, ValueError, OverflowError, user_model.DoesNotExist):
            user = None
            return render(request, self.template_name_no_uid, locals())


class UserActivationView(TemplateView):
    """
    View for starting the password reset process.

    This view renders form to enter a username or email address. Upon
    successful entry of a user/email, an email is sent with password reset
    instructions and a confirmation message displayed.
    """
    template_name = "registration/register_activated.html"

    def get(self, request, uidb64=None, token=None):
        """Activate a user, given a valid token in the url."""
        if uidb64 is None or token is None:
            return render(request, 'registration/register_activate_no_token.html', locals())

        usermodel = get_user_model()
        try:
            uid = urlsafe_base64_decode(uidb64)
            user = usermodel._default_manager.get(pk=uid)
            user.is_active = True
            user.save()

        except (TypeError, ValueError, OverflowError, usermodel.DoesNotExist):
            user = None

        if user is None or default_token_generator.check_token(user, token) is False:
            return render(request, 'registration/register_activate_no_token.html', locals())

        return render(request, self.template_name, locals())


@sensitive_post_parameters()
@csrf_protect
@never_cache
def login(request, template_name='registration/login.html', redirect_field_name=REDIRECT_FIELD_NAME,
          authentication_form=AuthenticationForm, current_app=None, extra_context=None):
    """Displays the login form and handles the login action."""
    redirect_to = request.GET.get(redirect_field_name, )

    layout_name = "GEMM Log-In and/or Register Screen"
    error = None

    if request.method == "POST":
        # If this is a new user, then we return the registration form.
        if 'user_action' in request.POST and request.POST[
                'user_action'] == 'register':
            form = ProfileCreationForm(
                initial={
                    'username': request.POST['username'],
                    'password1': request.POST['password']}
            )
            return render(request, "registration/register.html", locals())

        # Otherwise, assume the user is trying to login.
        form = authentication_form(data=request.POST)
        if form.is_valid():
            netloc = urlparse(redirect_to)[1]

            # Use default setting if redirect_to is empty.
            if not redirect_to:
                redirect_to = settings.LOGIN_REDIRECT_URL

            # Do not allow redirection to different host.
            elif netloc and netloc != request.get_host():
                redirect_to = settings.LOGIN_REDIRECT_URL

            # Okay, security checks complete. Log the user in.
            auth_login(request, form.get_user())

            if request.session.test_cookie_worked():
                request.session.delete_test_cookie()

            return HttpResponseRedirect(redirect_to)

        else:
            error = "invalid username or password"

    else:
        form = authentication_form(request)

    request.session.set_test_cookie()

    current_site = get_current_site(request)

    context = {
        'error': error,
        'form': form,
        redirect_field_name: redirect_to,
        'site': current_site,
        'site_name': current_site.name,
        'layout_name': layout_name
    }
    if extra_context is not None:
        context.update(extra_context)
    return TemplateResponse(request, template_name, context)


def logout(request, next_page=None, template_name='registration/logout.html',
           redirect_field_name=REDIRECT_FIELD_NAME, current_app=None, extra_context=None):
    """Logs out the user and displays 'You are logged out' message."""
    auth_logout(request)
    redirect_to = request.GET.get(redirect_field_name, )
    if redirect_to:
        netloc = urlparse(redirect_to)[1]
        # Security check -- do not allow redirection to a different host.
        if not (netloc and netloc != request.get_host()):
            return HttpResponseRedirect(redirect_to)

    if next_page is None:
        current_site = get_current_site(request)
        context = {
            'site': current_site,
            'site_name': current_site.name,
            'title': _('Logged out')
        }
        if extra_context is not None:
            context.update(extra_context)
        return TemplateResponse(request, template_name, context)

    # Redirect to this page until the session has been cleared.
    return HttpResponseRedirect(next_page or request.path)
