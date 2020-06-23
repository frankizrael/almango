<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'dc_almango' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '(}d0ah~OHTVyAi<-*9GZeCk^HD}]`h!+.`Y,9@]*u!sTS^zD9&XG!8:mmyN%KH|q' );
define( 'SECURE_AUTH_KEY',  'Q}jJbx5b@!z6@x0e-X@g3;#C#:f17AlFt,%f7,W(dpZOFn: %<b%#,_E$N(/2pU2' );
define( 'LOGGED_IN_KEY',    '.5 &_4zV[SAqcX.U*CC <2.r(e|uNzd@14?FuV,7v6-1#5)fm/GE71)[@0+[hx>A' );
define( 'NONCE_KEY',        'fH-3^/rftSl1[q^Qeg<RvB#H8R.k*{,d5553r,@)[{/f/+y:#Eic:Os;Z<xw;Cq`' );
define( 'AUTH_SALT',        ')B6g0pP$`w28ra9&Oy:s~_]2_S!?Q.!2UU)<fV.[;Nj>4P4G6GL$2y%uVP,{lh4*' );
define( 'SECURE_AUTH_SALT', 'uKxpt*NkxFn)X^wB,&hED$MP`~M)gwK(y#@AX&4G1UQ$_yrTF$j%q!H5|Z)SGwQn' );
define( 'LOGGED_IN_SALT',   'y&u4E!&dwO2?:+^_D(WodGuDDs^J>=YS*Dd?9:7FJB:{z{%e6X>a:c]<*>t[<CDL' );
define( 'NONCE_SALT',       'joehbo@4`,ywg!A$QJtnltT=Ek~E9,.Jvm`UO_RHNQ4ebTxG$CzMKsfI13G%tL|6' );

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'al_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
