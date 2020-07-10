m4_divert(0)m4_dnl
<!DOCTYPE html>
m4_ifdef({|__ROOT|},, {|m4_define({|__ROOT|}, {||})|})m4_dnl
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>__TITLE | __SITE_TITLE</title>
        <meta name="description" content="">
        <meta name="author" content="__AUTHOR">
        <meta name="Copyright" content="&copy; __AUTHOR __COPYRIGHTYEAR. All Rights Reserved.">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="__ROOT/css/tufte.css">
        <link rel="stylesheet" type="text/css" href="__ROOT/css/index.css">
    </head>
    <body>
      <header role="banner">
	<hgroup>
	  <h1>__SITE_TITLE</h1>
<!--	  <h2>__SITE_SUBTITLE</h2> -->
	</hgroup>
      <nav>
	<ul id="navmenu">
          <li><a href="__ROOT/index.html">Home</a></li>
          <li><a href="__ROOT/news/index.html">News</a></li>
          <li><a href="__ROOT/atom.xml">Feed</a></li>
    </ul>
      </nav>
      </header>
	<div id="content">
m4_dnl
m4_divert(4)m4_dnl  --- Content will be placed here ---
m4_dnl
	</div>
      <footer>
	<ul id="copyright">
	  <li>&copy; __COPYRIGHTYEAR __AUTHOR</li>
	  <li>Built with
	    <a href="https://github.com/Colelyman/last">last</a>
	  </li>
	  <li>Last update m4_esyscmd(date +"%Y-%m-%d %H:%M")</li>
	</ul>
      </footer>
    </body>
</html>
