from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound

from ..models import (
    db,
    )

from ..forms import ContactForm
from ..apps.visit_counter import count_visit


@view_config(route_name='home', renderer='home.mako')
def homepage(request):

    #print(request.user_agent)
    #print(request.client_addr)
    #print(request.current_route_url())
    count_visit(request)
    return {'project': 'tools_compulife'}


@view_config(route_name='contact', renderer="contact.mako")
def contact_form(request):

    count_visit(request)
    f = ContactForm(request.POST)   # empty form initializes if not a POST request

    if 'POST' == request.method and 'form.submitted' in request.params:
        if f.validate():
            #TODO: Do email sending here.

            request.session.flash("Your message has been sent!")
            return HTTPFound(location=request.route_url('home'))

    return {'contact_form': f}
