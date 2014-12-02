<%inherit file="/base.mako"/>
<%namespace name="charting" file="charting.mako" />

<%def name="title()">
Visit counter stats
</%def>

<script type="text/javascript">
  function view_details() {
    require(["dojo/dom", "dojo/date/locale"], function(dom, locale){
            var date_str = locale.format(dijit.byId('date_from').value, {formatLength: 'full', selector:'date', datePattern:'yyyy-MM-dd'});
            console.log(date_str);
            window.location.href = '/visit_counter/details/' + date_str;
        });
  }
</script>

<div class="row">
  View detailed logs for a date:
  <input data-dojo-props="constraints: {}" data-dojo-type="dijit/form/DateTextBox"
         id="date_from" name="date_from" type="text" value="${today}" />
  
  
  <button class="btn btn-sm btn-primary" onclick="view_details();">View detailed log</button>
</div>

${charting.line_chart(data=stats, div_name="daily_traffic_chart", width="100%", height="200px")}

<div class="row">
  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
    <table class="table table-striped table-condensed">
      <caption class="bg-primary" style="font-size: larger; font-weight: bold;">Overall Visits (Top 10)</caption>
      <thead>
        <tr class="bg-info" style="font-weight: bold;"><th>URL</th><th>Visits</th></tr>
      </thead>
      <tbody>
        %for row in url_stats:
          <tr><td>${row[0]}</td><td>${row[1]}</td></tr>
        %endfor
      </tbody>
    </table>
  </div>
  <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
    ${charting.pie_chart(data=url_stats, div_name='pie_chart')}
  </div>
</div>



<!--<div>
  <div class="middle align-center">
    <p class="app-welcome">
    <img src="${request.static_url(APP_BASE + ':static/webapp.png')}" />  Welcome to visit_counter app
    </p>
  </div>
</div>-->
