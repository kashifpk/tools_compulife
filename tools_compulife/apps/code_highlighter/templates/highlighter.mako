<%inherit file="/base.mako"/>
<%!
from urlparse import urlparse
%>
<%def name="title()">
Code Highlighter
</%def>

<%def name="meta()">
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
  <meta name="keywords" content="syntax highlight code highlighter online ${" ".join(lexers)}" />
  <meta name="description" content="Online code highlighter. Syntax highlighting for many programming languages, scritps and formatting languages" />
</%def>
  
<%def name="extra_head()">
  <script type="application/x-javascript">
  function submit_form() {
    language = dijit.byId('language').value;
    style = dijit.byId('style').value;
    
    // ${request.current_route_url()}
    // ${urlparse(request.current_route_url()).path}
    url = "${urlparse(request.current_route_url()).path.rstrip('/')}" + "/" + language + "/" + style;
    
    var myform = document.myform;
    myform.action = url;
    
    myform.submit();
  }
  
  require(["dojox/form/Uploader", "dojox/form/uploader/plugins/HTML5", "dojox/form/uploader/FileList"]);
  </script>
</%def>

<div class="well" style="text-align: center">
  <h1>Code Highlighter</h1>
</div>

<div class="row">
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <!-- top_banner -->
    <ins class="adsbygoogle"
         style="display:inline-block;width:728px;height:90px"
         data-ad-client="ca-pub-2220433291049397"
         data-ad-slot="1814908460"></ins>
    <script>
    (adsbygoogle = window.adsbygoogle || []).push({});
    </script>
  </div>
</div>

<form enctype="multipart/form-data" action="" method="POST" role="form" name="myform" id="myform">

<div class="row">
  <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
    <label for="language">Language: </label>
    <select data-dojo-type="dijit/form/FilteringSelect" id="language" name="language">
      <option value=""></option>
      %for lang in lexers:
        <option>${lang}</option>
      %endfor
    </select>
  </div>
  
  <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
    <label for="style">Style: </label>
    <select data-dojo-type="dijit/form/FilteringSelect" id="style" name="style">
      <option value=""></option>
      %for style in styles:
        <option>${style}</option>
      %endfor
    </select>
  </div>
  
  <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
    <label for="code_file"><b>OR</b> upload file</label>
    <input id="code_file" name="code_file" type="file" />
  </div>
  
  <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3" style="text-align: center;">
    <button type="button" class="btn btn-sm btn-primary" onclick="submit_form();">Highlight code</button>
  </div>
</div>

<div class="row">
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
  <label for="code">Code: </label><br />
  <textarea data-dojo-type="dijit/form/Textarea" id="code" name="code" style="height: 300px;" rows="20"></textarea>
  </div>
</div>
<br />
<div class="row">
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="text-align: center;">
    <button type="button" class="btn btn-lg btn-primary" onclick="submit_form();">Highlight code</button>
  </div>
</div>
</form>

