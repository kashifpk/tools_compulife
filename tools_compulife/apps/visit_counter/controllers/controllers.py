from datetime import datetime
from pyramid.view import view_config

from ..models import db, Visit, History
from .. import APP_NAME, PROJECT_NAME, APP_BASE


@view_config(route_name=APP_NAME+'.home', renderer='%s:templates/stats.mako' % APP_BASE)
def stats(request):
    "Display stats summary"

    recs = Visit.get_stats()
    return {'APP_BASE': APP_BASE, 'stats': recs}


@view_config(route_name=APP_NAME+'.details', renderer='%s:templates/details.mako' % APP_BASE)
def details(request):

    date_str = request.matchdict['date']   # yyyy-mm-dd format
    records = Visit.get_records(date_str)
    date_stats = Visit.get_stats(date_str, limit=None, sort=False)
    print(date_stats)

    return {'APP_BASE': APP_BASE, 'records': records,
            'date': date_str, 'stats': date_stats}


@view_config(route_name=APP_NAME+'.daily_status', renderer='%s:templates/list.mako' % APP_BASE)
def daily_stats(request):
    return {'APP_BASE': APP_BASE}
