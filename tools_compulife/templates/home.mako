<%inherit file="base.mako"/>

<%def name="title()">
Online tools for developers
</%def>

<!--<div class="row">-->
  <!--<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">-->
    <!--<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>-->
    <!-- top_banner -->
    <!--<ins class="adsbygoogle"-->
    <!--     style="display:inline-block;width:728px;height:90px"-->
    <!--     data-ad-client="ca-pub-2220433291049397"-->
    <!--     data-ad-slot="1814908460"></ins>-->
    <script>
    //(adsbygoogle = window.adsbygoogle || []).push({});
    </script>
  <!--</div>-->
<!--</div>-->

<div class="well">
<a href="${request.route_url('code_highlighter.home')}">Code Highlighter</a>
</div>

<div class="well">
<a href="${request.route_url('geoip.home')}">GeoIP</a>
</div>
