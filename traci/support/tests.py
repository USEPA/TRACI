# tests.py (support)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
This file houses test cases for the Support module.

Available functions:
- None
"""

# TODO Test Email sender:
# https://stackoverflow.com/questions/3728528/testing-email-sending

# from GSC_SSSENR.calculate import calculate_bredehoeft, calculate_schmidt,
# calculate_hatch, calculate_mccallum, sub_datetime_strings
from django.contrib.auth.models import User
from django.test import Client, TestCase
from django.test.client import RequestFactory
from support.test_data.support_data import SUPPORT_ONE, data, files, SUPPORT_FORM
# from support.test_data.support_forms import SUPPORT_PASS_ONE


class TestSupport(TestCase):
    """Test the functions related to Support module."""

    def setUp(self):
        """Prepare necessary objects for testing the Support module."""
        self.client = Client()
        self.user = User.objects.create_user(username='testuser', password='12345')
        self.client.login(username='testuser', password='12345')
        self.factory = RequestFactory()

    def test_home(self):
        """Tests the home page."""
        # response = self.client.get('/support/index')
        response = self.client.get('/support/index/')
        self.assertContains(response, 'Help/Suggestions', 0, 200)

    def test_request_information_view_get(self):
        """Tests the Request Information View get page."""
        response = self.client.get('/support/request_info/', SUPPORT_ONE)
        self.assertContains(response, 'information', 3, 200)

    def test_request_information_view_post(self):
        """Tests the Request Information View post page."""
        response = self.client.post('/support/request_info/', SUPPORT_ONE)
        self.assertContains(response, 'information', 1, 200)

    def test_user_manual_view_get(self):
        """Tests the User Manual View get page."""
        response = self.client.get('/support/manual/', SUPPORT_ONE)
        self.assertContains(response, 'manual', 5, 200)

    def test_user_create_get(self):
        """Tests the create get page."""
        response = self.client.get('/support/create/', data, files)
        print(response)
        self.assertContains(response, 'create', 2, 200)

    def test_user_create_post(self):
        """Tests the create post page."""
        response = self.client.post('/support/create/', data)
        print(response)
        self.assertContains(response, 'create', 2, 200)

    def test_list_supports_get(self):
        """Tests the list supports get."""
        response = self.client.get('/support/list/', SUPPORT_FORM)
        self.assertContains(response, 'id', 25, 200)

    def test_list_supports_post(self):
        """Tests the list supports post."""
        response = self.client.post('/support/list/', SUPPORT_FORM)
        self.assertContains(response, 'id', 25, 200)

    def test_search_support_get(self):
        """Tests the search support get."""
        response = self.client.get('/support/search/', SUPPORT_FORM)
        self.assertContains(response, 'id', 25, 200)

    def test_search_support_post(self):
        """Tests the search support post."""
        response = self.client.post('/support/search/', SUPPORT_FORM)
        self.assertContains(response, 'id', 25, 200)

    def test_search_support_for_last_30_get(self):
        """Tests the search support for last30 get."""
        response = self.client.get('/support/support/search/result/thirty/', SUPPORT_FORM)
        self.assertContains(response, 'id', 25, 200)

    def test_search_support_for_last_30_post(self):
        """Tests the search support for last30 post."""
        response = self.client.post('/support/support/search/result/thirty/', SUPPORT_FORM)
        self.assertContains(response, 'id', 25, 200)

    def test_search_support_for_last_60_get(self):
        """Tests the search support for last60 get."""
        response = self.client.get('/support/support/search/result/sixty/', SUPPORT_FORM)
        self.assertContains(response, 'id', 25, 200)

    def test_search_support_for_last_60_post(self):
        """Tests the search support for last60 post."""
        response = self.client.post('/support/support/search/result/sixty/', SUPPORT_FORM)
        self.assertContains(response, 'id', 25, 200)

    def test_search_support_for_last_90_get(self):
        """Tests the search support for last90 get."""
        response = self.client.get('/support/support/search/result/ninety/', SUPPORT_FORM)
        self.assertContains(response, 'id', 25, 200)

    def test_search_support_for_last_90_post(self):
        """Tests the search support for last90 post."""
        response = self.client.post('/support/support/search/result/ninety/', SUPPORT_FORM)
        self.assertContains(response, 'id', 25, 200)

    def test_search_support_for_last_180_get(self):
        """Tests the search support for last180 get."""
        response = self.client.get('/support/support/search/result/one_eighty/', SUPPORT_FORM)
        self.assertContains(response, 'id', 25, 200)

    def test_search_support_for_last_180_post(self):
        """Tests the search support for last180 post."""
        response = self.client.post('/support/support/search/result/one_eighty/', SUPPORT_FORM)
        self.assertContains(response, 'id', 25, 200)

    def test_create_support_type_get(self):
        """Tests the create support type get."""
        response = self.client.get('/support/type/create/', SUPPORT_FORM)
        self.assertContains(response, 'id', 30, 200)

    def test_create_support_type_post(self):
        """Tests the create support type post."""
        response = self.client.post('/support/type/create/', SUPPORT_FORM)
        self.assertContains(response, 'id', 0, 302)

# TODO commmented code.
    # def test_list_support_types_get(self):
    #     """Tests the list support types get."""
    #     response = self.client.get('/support/type/list/', SUPPORT_FORM)
    #     self.assertContains(response, 'id', 2, 200)

    # def test_list_support_types_post(self):
    #     """Tests the list support types post."""
    #     response = self.client.post('/support/type/list/', SUPPORT_FORM)
    #     self.assertContains(response, 'id', 2, 200)

    # def test_search_support_type_get(self):
    #     """Tests the search support type get."""
    #     response = self.client.get('/support/type/search/', SUPPORT_FORM)
    #     self.assertContains(response, 'id', 2, 200)

    # def test_search_support_type_post(self):
    #     """Tests the search support type post."""
    #     response = self.client.post('/support/type/search/', SUPPORT_FORM)
    #     self.assertContains(response, 'id', 2, 200)

    # def test_create_priority_get(self):
    #     """Tests the create priority get."""
    #     response = self.client.get('/support/priority/create/', SUPPORT_FORM)
    #     self.assertContains(response, 'id', 2, 200)

    def test_create_priority_post(self):
        """Tests the create priority post."""
        response = self.client.post('/support/priority/create/', SUPPORT_FORM)
        self.assertContains(response, 'id', 0, 302)

    # def test_list_priorities_get(self):
    #     """Tests the list priorities get."""
    #     response = self.client.get('/support/priority/list/', SUPPORT_FORM)
    #     self.assertContains(response, 'id', 2, 200)

    # def test_list_priorities_post(self):
    #     """Tests the list priorities post."""
    #     response = self.client.post('/support/priority/list/', SUPPORT_FORM)
    #     self.assertContains(response, 'id', 2, 200)

    # def test_search_priority_get(self):
    #     """Tests the search priority get."""
    #     response = self.client.get('/support/priority/search/', SUPPORT_FORM)
    #     self.assertContains(response, 'id', 2, 200)

    # def test_search_priority_post(self):
    #     """Tests the search priority post."""
    #     response = self.client.post('/support/priority/search/', SUPPORT_FORM)
    #     self.assertContains(response, 'id', 2, 200)

    # def test_support_ticket_create_one(self):
    #     """Test the support ticket form when you use suggestion."""
    #     # create/(?P<support_type_name>\w+)
    #     response = self.client.get('/support/create/suggestion/')
    #     self.assertContains(response, 'Describe your suggestion for GWSC below.', 1, 200)

    # def test_support_ticket_create_two(self):
    #     """Test the support ticket form when you do not use suggestion."""
    #     # create/(?P<support_type_name>\w+)
    #     response = self.client.get('/support/create/OtherWordsHERE/')
    #     self.assertContains(response, 'Describe the problem you encountered with GWSC below.', 1, 200)

    # def test_support_post_one(self):
    #    """Tests the support ticket post method on an invalid form."""
    #    response = self.client.post("/support/create/suggestion/", {})
    #    # TODO Assert?
    #    # self.assertContains(response, 'This field is required.', 7, 200)
    #    # self.assertContains(response, 'Temperature values are required and
    #    # must be greater than 0!', 1, 200)

    # def test_support_post_two(self):
    #    """Tests the support ticket post method on an Valid form."""
    #    data = SUPPORT_PASS_ONE.__dict__
    #    response = self.client.post("/support/create/suggestion/", data)
    #    # TODO Assert?

    # def test_support_ticket_edit_one(self):
    #     """Test the support ticket edit form when you use suggestion."""
    #     # edit/(?P<support_type_name>\w+)/(?P<obj_id>\d+)/$'
    #     response = self.client.get('/support/edit/suggestion/1/')
    #     self.assertContains(response, 'Describe your suggestion for GWSC below.', 1, 404)
