<%!
from tools_compulife.auth import is_allowed

auth_links = [('home', 'Home'), ('contact', 'Contact Us')]

%>

<!DOCTYPE html>
<html>
<head>
  
  <title>${self.title()}</title>
  ${self.meta()}
  
  <meta name="viewport" content="width=device-width, user-scalable=no">
  <link rel="icon" href="${request.route_url('favicon')}" />
  <link rel="shortcut icon" href="${request.route_url('favicon')}" />  
  
  <!-- Bootstrap -->
  <link rel="stylesheet" href="${request.static_url('tools_compulife:static/bootstrap/css/bootstrap.min.css')}">
  <link rel="stylesheet" href="${request.static_url('tools_compulife:static/bootstrap/css/bootstrap-theme.min.css')}">
  
  <!-- Custom CSS -->
  <link rel="stylesheet" href="${request.static_url('tools_compulife:static/pyck.css')}" type="text/css" media="screen" charset="utf-8" />
  
  <!-- Dojo -->
  <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.10.1/dojo/resources/dojo.css" type="text/css" charset="utf-8" />
  <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/dojo/1.10.1/dijit//themes/claro/claro.css" type="text/css" charset="utf-8" />
  <script src="//ajax.googleapis.com/ajax/libs/dojo/1.10.1/dojo/dojo.js" data-dojo-config="isDebug: true, async: true, parseOnLoad: true"></script>
  <script type="text/javascript">
        require(['dojo/parser', 'dojo/domReady'],function(parser,ready){ready(function(){
          parser.parse();
          });});
  </script>

  ${self.extra_head()}
</head>

<%def name="extra_head()">
</%def>

<body class="${self.body_class()}" ${self.body_attrs()}>
   <div class="container">
	<div class="row">
		<div class="col-md-12">
			${self.header()}
		</div>
	</div>
    ${self.content_wrapper()}
	<div class="row">
		<div class="col-md-12">${self.footer()}</div>
	</div>
  </div>
</body>
</html>

<%def name="title()">Online tools for developers</%def>

<%def name="meta()">
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <meta name="keywords" content="tools web developer programmer syntax code highlight" />
  <meta name="description" content="Online tools for web developers, academics, security reserachers and bloggers. First tools is code/syntax highlighter" />
</%def>

<%def name="body_class()">
claro
</%def>
<%def name="body_attrs()">
</%def>
<%def name="header()">
  <div>
    ${self.main_menu()}
  </div>
</%def>
  
<%def name="content_wrapper()">
    
<% flash_msgs = request.session.pop_flash() %>

%for flash_msg in flash_msgs:
  <div class="alert alert-info">
	${flash_msg}
  </div>
%endfor
    
${self.body()}
  
</%def>
    
<%def name="main_menu()">
<nav class="navbar navbar-inverse" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <a href="${request.route_url('home')}">
			  <img style="vertical-align: top;" src="${request.static_url('tools_compulife:static/logo_small.png')}"  alt="compulife tools" />
	  </a>
    </div>

    
    
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        %for routename, desc in auth_links:
          <%
          row_class = ""
          if request.route_url(routename) == request.current_route_url():
              row_class = "active"
          %>
          
          %if is_allowed(request, routename):
            <li class="${row_class}"><a href="${request.route_url(routename)}">${desc}</a></li>
          %endif
        %endfor
      </ul>
      <!--<form class="navbar-form navbar-left" role="search">-->
      <!--  <div class="form-group">-->
      <!--    <input type="text" class="form-control" placeholder="Search">-->
      <!--  </div>-->
      <!--  <button type="submit" class="btn btn-default">Submit</button>-->
      <!--</form>-->
      <ul class="nav navbar-nav navbar-right">
        <p class="navbar-text navbar-right">Kashif Iftikahr</p>
        
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

  
  
  
  
  

</%def>
<%def name="footer()">
<div class="row">
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
    <div class="well well-lg" style="text-align: center">
       Posered by <a href="http://pyck.compulife.com.pk">PyCK Framework</a> from <a href="http://www.compulife.com.pk">CompuLife</a>
	</div>
  </div>			  
  
</div>

</%def>

