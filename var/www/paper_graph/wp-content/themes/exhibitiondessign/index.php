<?php get_header(); ?>
  
  <div id="content">
  
    <?php $shortname = "exhibition"; ?>

    <?php if(get_option($shortname.'_disable_slideshow','') != "Yes") { ?>

    <div id="slider_container">
      <div class="slider-wrapper theme-default">
          <div class="ribbon"></div>
          <div id="slider" class="nivoSlider">
          
          <?php
          $args = array(
                       //'category_name' => 'blog',
                       'post_type' => 'post',
                       'meta_key' => 'ex_show_in_slideshow',
                       'meta_value' => 'Yes',
                       'posts_per_page' => 10
                       //'paged' => ( get_query_var('paged') ? get_query_var('paged') : 1),
                       );
          query_posts($args);
          while (have_posts()) : the_post(); ?>
          
          <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('featured-slideshow',array('alt' => '', 'class' => 'slide_img', 'title' => '')); ?></a>
          
          <?php endwhile; ?>
          <?php wp_reset_query(); ?>
          
<!--              <img src="<?php //bloginfo('stylesheet_directory'); ?>/images/slider.png" alt="" />
              <img src="<?php //bloginfo('stylesheet_directory'); ?>/images/slider.png" alt="" />
              <img src="<?php //bloginfo('stylesheet_directory'); ?>/images/slider.png" alt="" />-->
          </div>
      </div>    
    </div><!--//slider_container-->
    
    <?php } ?>
    
    <div class="clear"></div>
    
    <ul class="featured_home_medium">
    <?php
    $args = array(
                 'category_name' => 'featured-medium',
                 'post_type' => 'post',
                 'posts_per_page' => 2,
		
                 'paged' => ( get_query_var('paged') ? get_query_var('paged') : 1),
                 );
    query_posts($args);
    $x = 0;
    while (have_posts()) : the_post(); ?>
      <?php if($x == 1) { ?>
        <li class="last"><div class="img_container"><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('featured-medium'); ?></a></div></li>
      <?php } else { ?>
        <li><div class="img_container"><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('featured-medium'); ?></a></div></li>
      <?php } ?>
    <?php $x++; ?>
    <?php endwhile; ?>
    <?php wp_reset_query(); ?>
    </ul>
    
    <ul class="featured_home_big">
    <?php
    $args = array(
                 'category_name' => 'featured-big',
                 'post_type' => 'post',
                 'posts_per_page' => 2,
                 'paged' => ( get_query_var('paged') ? get_query_var('paged') : 1),
                 );
    query_posts($args);
    $x = 0;
    while (have_posts()) : the_post(); ?>
      <?php if($x == 1) { ?>
        <li class="last"><div class="img_container"><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('featured-big'); ?></a></div></li>
      <?php } else { ?>
        <li><div class="img_container"><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('featured-big'); ?></a></div></li>
      <?php } ?>
    <?php $x++; ?>
    <?php endwhile; ?>
    <?php wp_reset_query(); ?>
    </ul>
    
    <ul class="featured_home_medium">
    <?php add_filter('post_limits', 'my_post_limit'); ?>
    <?php
    global $myOffset;
    $myOffset = 2;
    $args = array(
                 'category_name' => 'featured-medium',
                 'post_type' => 'post',
                 'posts_per_page' => 4,
                 'offset' => $myOffset,
                 'paged' => ( get_query_var('paged') ? get_query_var('paged') : 1),
                 );
    query_posts($args);
    $x = 0;
    while (have_posts()) : the_post(); ?>
      <?php if($x == 1 || $x == 3) { ?>
        <li class="last"><div class="img_container"><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('featured-medium'); ?></a></div></li>
      <?php } else { ?>
        <li><div class="img_container"><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('featured-medium'); ?></a></div></li>
      <?php } ?>
    <?php $x++; ?>
    <?php endwhile; ?>

    </ul>
    
    <div class="home_navigation">
      <?php if(function_exists('wp_pagenavi')) { ?>
      <?php wp_pagenavi(); ?>
      <?php } ?>
    </div><!--//home_navigation-->

<?php $wp_query = null; $wp_query = $temp;?>
<?php remove_filter('post_limits', 'my_post_limit'); ?>


    <?php wp_reset_query(); ?>
    
  </div><!--//content-->
  
<?php get_sidebar(); ?>
  
<?php get_footer(); ?>