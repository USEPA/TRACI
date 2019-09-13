# views.py (substances)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

"""
Substance management views.

Available functions:
- API GET substances
"""

from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import permissions
from django.http import HttpResponse
import json
from substances.models import Substance
from substances.serializers import SubstanceSerializer

#########################
# REST Api Substance views
#########################

class APISubstanceListView(APIView):
    """Get a JSON list of all substances (GET)."""

    permission_classes = (permissions.IsAuthenticated,)

    def get(self, request, exclude=None, format=None):
        """Return all substances."""
        substances = (Substance.objects.all())
        serializer = SubstanceSerializer(substances, many=True)
        return Response(serializer.data)


def get_substances(request):
    """Retrieve a filtered list of substances."""
    if request.is_ajax():
        q = request.GET.get('term', '')
        substances = Substance.objects.filter(name__icontains = q)[:20]
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