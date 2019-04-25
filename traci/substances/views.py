# views.py (TRACI)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov


from django.http import HttpResponse


def home(request):
    return HttpResponse("Hello, TRACI Users!")
