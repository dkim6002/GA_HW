<!DOCTYPE html>
<html>
<head>
	<title><?php bloginfo('name'); ?></title>
</head>
<body>
	<?php if ( have_posts() ) : ?>
		<?php while ( have_posts() ) : the_post(); ?>    
			<?php the_title(); ?>
			<?php the_content(); ?>
		<?php endwhile; ?>
	<?php endif; ?>

</body>
</html>