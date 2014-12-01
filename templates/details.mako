<%inherit file="/base.mako"/>

<%def name="title()">
Visit records
</%def>

<table class="table table-striped table-condensed">
  <caption class="bg-primary" style="font-size: larger; font-weight: bold;">Visit log for ${date}</caption>
  <thead>
    <tr class="bg-info" style="font-weight: bold;">
      <th>Timestamp</th>
      <th>Client IP</th>
      <th>URL</th>
      <th>Browser (User Agent)</th>
    </tr>
  </thead>
  <tbody>
    %for rec in records:
      <tr>
        <td>${rec.timestamp}</td>
        <td>${rec.source_ip}</td>
        <td>${rec.url}</td>
        <td>${rec.user_agent}</td>
      </tr>
    %endfor
  </tbody>
</table>



<!--<div>
  <div class="middle align-center">
    <p class="app-welcome">
    <img src="${request.static_url(APP_BASE + ':static/webapp.png')}" />  Welcome to visit_counter app
    </p>
  </div>
</div>-->
