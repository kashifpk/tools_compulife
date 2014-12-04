from pyramid.view import view_config

from ..models import db
from ..lib import get_names
from .. import APP_NAME, PROJECT_NAME, APP_BASE, project_package

count_visit = project_package.apps.visit_counter.count_visit

@view_config(route_name=APP_NAME+'.home',
             renderer='%s:templates/highlighter.mako' % APP_BASE)
def highlighter_home(request):
    "Main page for code highlighter"

    count_visit(request)
    lexers, styles = get_names()
    return {'APP_BASE': APP_BASE, 'lexers': lexers, 'styles': styles}
