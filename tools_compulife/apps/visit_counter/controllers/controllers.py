from datetime import datetime
from pyramid.view import view_config

from ..models import db, Visit, History
from .. import APP_NAME, PROJECT_NAME, APP_BASE
from ..lib import get_stats


@view_config(route_name=APP_NAME+'.home', renderer='%s:templates/stats.mako' % APP_BASE)
def stats(request):
    "Display stats summary"

    recs = get_stats()
    return {'APP_BASE': APP_BASE, 'stats': recs}


@view_config(route_name=APP_NAME+'.details', renderer='%s:templates/details.mako' % APP_BASE)
def details(request):

    date_str = request.matchdict['date']   # yyyy-mm-dd format
    records = Visit.get_records(date_str)

    return {'APP_BASE': APP_BASE, 'records': records, 'date': date_str}


@view_config(route_name=APP_NAME+'.daily_status', renderer='%s:templates/list.mako' % APP_BASE)
def daily_stats(request):
    return {'APP_BASE': APP_BASE}
