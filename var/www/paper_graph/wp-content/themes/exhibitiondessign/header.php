<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml">
<head> 
  <title><?php wp_title('&laquo;', true, 'right'); ?> <?php bloginfo('name'); ?></title>          
  <link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" title="no title" charset="utf-8"/>
  <?php wp_head(); ?>

  <link rel="stylesheet" href="<?php bloginfo('stylesheet_directory'); ?>/themes/default/default.css" type="text/css" media="screen" />
  <link rel="stylesheet" href="<?php bloginfo('stylesheet_directory'); ?>/css/nivo-slider.css" type="text/css" media="screen" />
  <script type="text/javascript" src="<?php bloginfo('stylesheet_directory'); ?>/js/jquery-1.6.1.min.js"></script>
  <script type="text/javascript" src="<?php bloginfo('stylesheet_directory'); ?>/js/jquery.nivo.slider.js"></script>
</head>
<body>

<div id="header_full">
  <div id="header">
    <?php $shortname = "exhibition"; ?>
    
    <?php if(get_option($shortname.'_custom_background_color','') != "") { ?>
    <style type="text/css">
      body { background-color: <?php echo get_option($shortname.'_custom_background_color',''); ?>; }
    </style>
    <?php } ?>
    
    <script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider({
        pauseTime: <?php echo stripslashes(stripslashes(get_option($shortname.'_slideshow_timeout','5000'))); ?>,
        controlNav: false
        });
    });
    </script>  

    <?php if(get_option($shortname.'_custom_logo_url','') != "") { ?>
      <a href="<?php bloginfo('url'); ?>"><img src="<?php echo stripslashes(stripslashes(get_option($shortname.'_custom_logo_url',''))); ?>" class="logo" /></a>
    <?php } else { ?>
      <a href="<?php bloginfo('url'); ?>"><img src="<?php bloginfo('stylesheet_directory'); ?>/images/logo.png" class="logo" /></a>
    <?php } ?>
    
    <div id="menu_container">
      <?php wp_nav_menu('menu=header_menu&container=false&menu_id=menu'); ?>
<!--      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Blog</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="#">Contact</a></li>
      </ul>-->
      <div class="clear"></div>
    </div><!--//menu_container-->
    
    <div class="clear"></div>
  </div><!--//header-->
</div><!--//header_full-->

<div id="main_container">