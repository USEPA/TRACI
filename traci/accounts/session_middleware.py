# session_middleware.py (accounts)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Module related to users login session.

Available functions:
- Ensure user has only one logged session.
- Valid user login.
- Expire Django session after 5 minutes inactive.
- Clear COOKIES sessionid.
"""

from django.core.exceptions import ObjectDoesNotExist
from django.contrib.sessions.models import Session


class OnlyOneUserMiddleware:
    """
    Middleware to ensure that a logged-in user only has one session active.

    Will kick out any previous session.
    """

    @staticmethod
    def process_request(request):
        """Process any user login requests."""
        if request.user.is_authenticated():
            cur_session_key = request.user.get_profile().session_key
            if cur_session_key and cur_session_key != request.session.session_key:
                # Default handling... kick the old session...
                try:
                    temp_s = Session.objects.get(session_key=cur_session_key)
                    temp_s.delete()
                except ObjectDoesNotExist:
                    pass
            if not cur_session_key or cur_session_key != request.session.session_key:
                temp_p = request.user.get_profile()
                temp_p.session_key = request.session.session_key
                temp_p.save()
