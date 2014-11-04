<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'root');

/** MySQL database password */
define('DB_PASSWORD', 'root');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '3osOI4S#)flcC]mkkTYtoLNO#d)<|&K82Bd+s+o3{?Ei~6T7$_d7Z|HNJR5R]cJ*');
define('SECURE_AUTH_KEY',  'KX+;^>OYXhz-3Q:^%=qG}7]Am!-`+1&CCx;.*BX9(V<1},:a[9WTon(Q/d$JTt4H');
define('LOGGED_IN_KEY',    'e830BVE[[N+Y$*fCgLd/XX1|4!F&Eb6WAv+.:UXPEcYeVcqY? ZZc>17Q{+<2V F');
define('NONCE_KEY',        '%!L?+M#3I/aS/8cQ#^J/n,{M~ h,<=M.VOJm<DY.|MZ[V@1kU(kj&rp]b]luh>-*');
define('AUTH_SALT',        'IW>VVbwF.+xw0 ^NwLRf2FVvjY[acKqkt!L_>YHK x}Z_kdYS@jiWujG5C6:y+88');
define('SECURE_AUTH_SALT', 'l0JBX;C9F=+Po#~hjR),+3qy@pAsB2.+|tfhf@zd9FZ`wr<CnJiH^>7H3*$t SkG');
define('LOGGED_IN_SALT',   'n##1uuO<Y{t4U~+CWoL(Th09nIH:tsQ`DE:kqAi=KI-uwr-x<1><,JY@NSLOuVmH');
define('NONCE_SALT',       'h}Nh|S5Q,]657{<Ad~Q5DyGJ_UqG;5P`M81[_j`H9@W7x.ftAW`w)gT&,+G4,3_^');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
