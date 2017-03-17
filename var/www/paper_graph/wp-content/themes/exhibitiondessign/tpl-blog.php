<?php
/*
  Template Name: Blog
*/
?>

<?php get_header(); ?>
  
  <div id="content">

     <?php
     global $post;
     $myposts = get_posts('numberposts=3&category_name=Blog');
     foreach($myposts as $post) :
       setup_postdata($post);
     ?>
  
    <div class="featured_big_box">
      <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('featured-blog'); ?></a>
      <h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
      <p><?php $temp_arr_content = explode(" ",substr(strip_tags(get_the_content()),0,550)); $temp_arr_content[count($temp_arr_content)-1] = ""; $display_arr_content = implode(" ",$temp_arr_content); echo $display_arr_content; ?><?php if(strlen(strip_tags(get_the_content())) > 550) echo "..."; ?></p>
    </div><!--//featured_big_box-->
    
    <?php endforeach; ?>
    <?php wp_reset_query(); ?>
    
  </div><!--//content-->
  
<?php get_sidebar(); ?>
  
<?php get_footer(); ?>