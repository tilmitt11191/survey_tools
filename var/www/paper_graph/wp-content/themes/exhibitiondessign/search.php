<?php get_header(); ?>
  
  <div id="content">
  
  
    <?php if (have_posts()) : ?>
    
    <?php while (have_posts()) : the_post(); ?>
  
    <div class="featured_big_box">
      <a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('featured-blog'); ?></a>
      <h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3>
      <p><?php $temp_arr_content = explode(" ",substr(strip_tags(get_the_content()),0,550)); $temp_arr_content[count($temp_arr_content)-1] = ""; $display_arr_content = implode(" ",$temp_arr_content); echo $display_arr_content; ?><?php if(strlen(strip_tags(get_the_content())) > 550) echo "..."; ?></p>
    </div><!--//featured_big_box-->
    
    <?php endwhile; ?>
    
	<?php else : ?>

		<h2 class="center">No posts found. Try a different search?</h2>
		<?php get_search_form(); ?>

	<?php endif; ?>
    
    <?php wp_reset_query(); ?>
    
  </div><!--//content-->
  
<?php get_sidebar(); ?>
  
<?php get_footer(); ?>