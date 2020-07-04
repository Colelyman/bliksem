m4_divert m4_dnl
<!DOCTYPE html>
m4_ifdef({"__ROOT"},, {"m4_define({"__ROOT"}, {""})"})m4_dnl
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>__TITLE</title>
        <meta name="description" content="">
	<meta name="author" content="Brandon Invergo">
	<meta name="Copyright" content="Copyright Brandon Invergo
					2012. All Rights Reserved.">
        <meta name="viewport" content="width=device-width">

        <link rel="stylesheet" href="__ROOT/css/normalize.min.css">
        <link rel="stylesheet" href="__ROOT/css/main.css">
    </head>
    <body>
      <header role="banner">
	<hgroup>
	  <h1>__SITE_TITLE</h1>
<!--	  <h2>__SITE_SUBTITLE</h2> -->
	</hgroup>
      </header>
      <nav>
	<ul id="navmenu">
          <li><a href="__ROOT/index.html">Home</a></li>
          <li><a href="__ROOT/news/index.html">News</a></li>
	  <li><a href="__ROOT/atom.xml">Feed</a></li>
        </ul>
      </nav>
      <div id="main">
	<div id="content">
m4_dnl
m4_divert(4)m4_dnl  --- Content will be placed here ---
m4_dnl
	</div>
      </div>
      <footer>
	<ul id="copyright">
	  <li>Copyright 2013 Brandon Invergo</li>
	  <li>Built with
	    <a href="https://gitorious.org/bi-websites/m4-bloggery">m4-bloggery</a>
	  </li>
	  <li>Last update m4_esyscmd(date +"%Y-%m-%d %H:%M")</li>
	</ul>
      </footer>
    </body>
</html>
