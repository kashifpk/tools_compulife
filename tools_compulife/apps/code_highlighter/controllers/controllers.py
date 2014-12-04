from pyramid.view import view_config
from pyramid.response import Response
from pyramid.httpexceptions import HTTPNotAcceptable,HTTPFound, HTTPBadRequest

from ..models import db
from ..lib import get_names, highlight_code
from .. import APP_NAME, PROJECT_NAME, APP_BASE, project_package

count_visit = project_package.apps.visit_counter.count_visit


@view_config(route_name=APP_NAME+'.home',
             renderer='%s:templates/highlighter.mako' % APP_BASE)
def highlighter_home(request):
    "Main page for code highlighter"

    count_visit(request)
    lexers, styles = get_names()
    return {'APP_BASE': APP_BASE, 'lexers': lexers, 'styles': styles}


@view_config(route_name=APP_NAME+'.highlight',
             renderer='%s:templates/code_highlight.mako' % APP_BASE)
def do_highlighting(request):
    "Highlighting processing and display"

    if request.method not in ['POST', 'PUT']:
        return HTTPNotAcceptable(detail="Only HTTP POST and HTTP PUT supported")

    max_size = int(request.registry.settings.get(
        'code_highlighter_max_upload_size', 2*1024*1024))

    count_visit(request)
    language = request.matchdict['language']
    style = request.matchdict['style']

    if hasattr(request.POST['code_file'], 'file'):
        code = request.POST['code_file'].file.read()
    else:
        code = request.POST['code']

    if len(code) > max_size:
        err_msg = """
        request content_length(%s) exceeds
        the configured maximum content_length allowed(%s)
        """ % (len(code), max_size)

        return HTTPBadRequest(err_msg)

    css_code, code = highlight_code(code, language, style)
    lexers, _ = get_names()

    #return Response(body=code, content_type="text/html")
    return {'APP_BASE': APP_BASE, 'lexers': lexers,
            'css_code': css_code, 'code': code}
