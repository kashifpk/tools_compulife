<%inherit file="base.mako"/>

<%def name="title()">
Online tools for developers
</%def>

<div class="well">
<a href="${request.route_url('visit_counter.home')}">View visit stats</a>  
</div>
