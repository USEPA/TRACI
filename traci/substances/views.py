# views.py (substances)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Substance management views.

Available functions:
- API GET substances
"""

from functools import reduce
import json
from operator import or_
from django.db.models import Q
from django.http import HttpResponse
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from substances.models import Substance
from substances.serializers import SubstanceSerializer

#########################
# REST Api Substance views
#########################

class APISubstanceListView(APIView):
    """Get a JSON list of all substances (GET)."""

    permission_classes = (permissions.IsAuthenticated,)

    def get(self, request, exclude=None, _format=None):
        """Return all substances."""
        substances = (Substance.objects.all())
        serializer = SubstanceSerializer(substances, many=True)
        return Response(serializer.data)


def get_units(request):
    """Retrieve a list of units for the specified resource/release type"""
    #if request.is_ajax():
    #    type_id = request.GET.get('type_id', '')
    #units = 

def get_substances(request):
    """Retrieve a filtered list of substances."""
    if request.is_ajax():
        query = request.GET.get('term', '')
        exceptions = json.loads(request.GET.get('except', '[]'))
        if exceptions:
            substances = Substance.objects.exclude(
                reduce(or_, [Q(name__iexact=query) for query in exceptions])).filter(name__icontains=query)[:20]
        else:
            substances = Substance.objects.filter(name__icontains=query)[:20]
        results = []
        for subst in substances:
            substance_json = {}
            substance_json['id'] = subst.id
            substance_json['label'] = subst.name
            substance_json['value'] = subst.name
            results.append(substance_json)
        data = json.dumps(results)
    else:
        data = 'fail'
    mimetype = 'application/json'
    return HttpResponse(data, mimetype)
