# views.py (chemicals)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
"""
Chemical management views.

Available functions:
- API GET chemicals
"""

from functools import reduce
import json
from operator import or_
from django.db.models import Q
from django.http import HttpResponse
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from chemicals.models import Chemical
from chemicals.serializers import ChemicalSerializer

#########################
# REST Api Chemical views
#########################


class APIChemicalListView(APIView):
    """Get a JSON list of all chemicals (GET)."""

    permission_classes = (permissions.IsAuthenticated, )

    def get(self, request, exclude=None, _format=None):
        """Return all chemicals."""
        chemicals = (Chemical.objects.all())
        serializer = ChemicalSerializer(chemicals, many=True)
        return Response(serializer.data)


def get_units(request):
    """Retrieve a list of units for the specified resource/release type"""
    # if request.is_ajax():
    #    type_id = request.GET.get('type_id', '')
    # units =


def get_chemicals(request):
    """Retrieve a filtered list of chemicals."""
    if request.is_ajax():
        query = request.GET.get('term', '')
        exceptions = json.loads(request.GET.get('except', '[]'))
        if exceptions:
            chemicals = Chemical.objects.exclude(
                reduce(or_, [Q(name__iexact=query) for query in exceptions
                             ])).filter(name__icontains=query)[:20]
        else:
            chemicals = Chemical.objects.filter(name__icontains=query)[:20]
        results = []
        for subst in chemicals:
            chemical_json = {}
            chemical_json['id'] = subst.id
            chemical_json['label'] = subst.name
            chemical_json['value'] = subst.name
            results.append(chemical_json)
        data = json.dumps(results)
    else:
        data = 'fail'
    mimetype = 'application/json'
    return HttpResponse(data, mimetype)
