from pyramid.view import view_config
from pyramid.response import Response
from pyramid.httpexceptions import HTTPNotAcceptable, HTTPFound

from ..models import db
from ..lib import get_names, highlight_code
from .. import APP_NAME, PROJECT_NAME, APP_BASE, project_package

count_visit = project_package.apps.visit_counter.count_visit


@view_config(route_name=APP_NAME+'.home',
             renderer='%s:templates/highlighter.mako' % APP_BASE)
def highlighter_home(request):
    "Main page for code highlighter"

    if "POST" == request.method:
        language = request.POST.get('language', None)
        style = request.POST.get('style', None)

        if not language:
            request.session.flash("Please select a language")

        if not style:
            request.session.flash("Please select a style")

        if language and style:
            count_visit(request,
                        '/{0}/{1}/{2}'.format(APP_NAME, language, style))

            code = highlight_code(request.POST['code'], language, style)
            return Response(body=code, content_type="text/html")

    count_visit(request)
    lexers, styles = get_names()
    return {'APP_BASE': APP_BASE, 'lexers': lexers, 'styles': styles}


@view_config(route_name=APP_NAME+'.highlight',
             renderer='%s:templates/code_highlight.mako' % APP_BASE)
def do_highlighting(request):
    "Highlighting processing and display"

    if request.method not in ['POST', 'PUT']:
        return HTTPNotAcceptable(detail="Only HTTP POST and HTTP PUT supported")

    count_visit(request)
    language = request.matchdict['language']
    style = request.matchdict['style']

    css_code, code = highlight_code(request.POST['code'], language, style)
    lexers, _ = get_names()

    #return Response(body=code, content_type="text/html")
    return {'APP_BASE': APP_BASE, 'lexers': lexers,
            'css_code': css_code, 'code': code}
