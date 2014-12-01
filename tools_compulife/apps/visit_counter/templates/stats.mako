<%inherit file="/base.mako"/>

<%def name="title()">
Visit counter stats
</%def>

<div class="row">
  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
    <table class="table table-striped table-condensed">
      <caption class="bg-primary" style="font-size: larger; font-weight: bold;">Overall Visits (Top 10)</caption>
      <thead>
        <tr class="bg-info" style="font-weight: bold;"><th>URL</th><th>Visits</th></tr>
      </thead>
      <tbody>
        %for row in stats:
          <tr><td>${row[0]}</td><td>${row[1]}</td></tr>
        %endfor
      </tbody>
    </table>
  </div>
  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
    Graph comes here
  </div>
</div>



<!--<div>
  <div class="middle align-center">
    <p class="app-welcome">
    <img src="${request.static_url(APP_BASE + ':static/webapp.png')}" />  Welcome to visit_counter app
    </p>
  </div>
</div>-->
