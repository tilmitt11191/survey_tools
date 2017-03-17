  <div id="sidebar">
  
      <div class="side_box">
        <ul class="featured_medium_list">
         <?php
         global $post;
         $myposts = get_posts('numberposts=2&category_name=Featured Small');
         foreach($myposts as $post) :
           setup_postdata($post);
         ?>
          <li><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('featured-medium'); ?></a></li>
        <?php endforeach; ?>
        <?php wp_reset_query(); ?>
        </ul>
        <div class="clear"></div>
      </div><!--//side_box-->
  
    <?php if ( !function_exists('dynamic_sidebar') || !dynamic_sidebar('Sidebar Top') ) : ?>       
      
      <div class="side_box">
        <img src="<?php bloginfo('stylesheet_directory'); ?>/images/search-icon.png" class="search_icon" />
        <input type="text" class="search_box" />
        <div class="clear"></div>
      </div><!--//side_box-->
      
      <div class="side_box">
        <h3>Random Text: About The Artist</h3>
        <p>This is a sample text about the artist, you can use widgets text to put any text you woule like in this space...This is a sample text about the artist, you can use widgets text to put any text you woule like in this space...This is a sample text about the artist, you can use widgets text to put any text you woule like in this space...This is a sample text about the artist, you can use widgets text to put any text you woule like in this space...</p>
      </div><!--//side_box-->
      
      <div class="side_box">
        <h3>STAY CONNECTED</h3>
        
        <ul class="stay_connected_list">
          <li><a href="#">Catch us on Dribbble</a> <img src="<?php bloginfo('stylesheet_directory'); ?>/images/dribbble-icon.png" /></li>
          <li><a href="#">Find us on Forrst</a> <img src="<?php bloginfo('stylesheet_directory'); ?>/images/forrst-icon.png" /></li>
          <li><a href="#">Find us on Facebook</a> <img src="<?php bloginfo('stylesheet_directory'); ?>/images/facebook-icon.png" /></li>
          <li><a href="#">Follow us on Twitter</a> <img src="<?php bloginfo('stylesheet_directory'); ?>/images/twitter-icon.png" /></li>
          <li class="last"><a href="#">Subscribe to our RSS</a> <img src="<?php bloginfo('stylesheet_directory'); ?>/images/rss-icon.png" /></li>
        </ul>
        <div class="clear"></div>
      </div><!--//side_box-->
      
      <div class="side_box">
        <h3>RECENT POSTS</h3>
        
        <ul class="recent_posts_list">
           <?php
           global $post;
           $myposts = get_posts('numberposts=5&category_name=Featured Small');
           foreach($myposts as $post) :
             setup_postdata($post);
           ?>
          <li><a href="<?php the_permalink(); ?>"><?php the_post_thumbnail('featured-small'); ?></a><h3><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h3><p><?php the_time('m.d.Y'); ?></p><div class="clear"></div></li>
          <?php endforeach; ?>
          <?php wp_reset_query(); ?>
        </ul>
      </div><!--//side_box-->
      
    <?php endif; ?>
  
  </div><!--//sidebar-->