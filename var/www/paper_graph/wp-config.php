<?php
/**
 * WordPress の基本設定
 *
 * このファイルは、インストール時に wp-config.php 作成ウィザードが利用します。
 * ウィザードを介さずにこのファイルを "wp-config.php" という名前でコピーして
 * 直接編集して値を入力してもかまいません。
 *
 * このファイルは、以下の設定を含みます。
 *
 * * MySQL 設定
 * * 秘密鍵
 * * データベーステーブル接頭辞
 * * ABSPATH
 *
 * @link http://wpdocs.sourceforge.jp/wp-config.php_%E3%81%AE%E7%B7%A8%E9%9B%86
 *
 * @package WordPress
 */

// 注意: 
// Windows の "メモ帳" でこのファイルを編集しないでください !
// 問題なく使えるテキストエディタ
// (http://wpdocs.sourceforge.jp/Codex:%E8%AB%87%E8%A9%B1%E5%AE%A4 参照)
// を使用し、必ず UTF-8 の BOM なし (UTF-8N) で保存してください。

// ** MySQL 設定 - この情報はホスティング先から入手してください。 ** //
/** WordPress のためのデータベース名 */
define('DB_NAME', 'paper_graph');

/** MySQL データベースのユーザー名 */
define('DB_USER', 'paper_graph');

/** MySQL データベースのパスワード */
define('DB_PASSWORD', 'pg');

/** MySQL のホスト名 */
define('DB_HOST', 'localhost');

/** データベースのテーブルを作成する際のデータベースの文字セット */
define('DB_CHARSET', 'utf8mb4');

/** データベースの照合順序 (ほとんどの場合変更する必要はありません) */
define('DB_COLLATE', '');

/**#@+
 * 認証用ユニークキー
 *
 * それぞれを異なるユニーク (一意) な文字列に変更してください。
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org の秘密鍵サービス} で自動生成することもできます。
 * 後でいつでも変更して、既存のすべての cookie を無効にできます。これにより、すべてのユーザーを強制的に再ログインさせることになります。
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'rBZ_}z8<VZxb~JX~V^*z_QC)QTlwMp]IClsX:s!V2vT-P=iEvX<5xN*:[z6ncy83');
define('SECURE_AUTH_KEY',  '[Sbt-*PuIF)Y~)r7rpZa}l4eqC?:]GY7LD!s$4~>Ti=2Ac>GRn#W_T(a,)Nl,]61');
define('LOGGED_IN_KEY',    'Aq^kdPt#&rh, qw}$3:3>E[S7&w%W^$UP4Li.)Fh(*Ue=0eZ./c EF1;9#>Q8eSP');
define('NONCE_KEY',        'GmzL5^0P7OK[Z*Lq8fth_!SCn?K,r0yB  RKMDjLcWX<2cQAP lV(W&fu:kzhyvw');
define('AUTH_SALT',        ';dsD5t4>vRWz+rOHV[&<|JGsBN>c>/9GBR+&bt(fnDdtW0XbI={uV{8*AkK]rwnA');
define('SECURE_AUTH_SALT', 'D?<=8A]u_;-@RXfH14N<.ZmcSNCf6?}zbW[p{u+5PN1!$I{UwL|#PK7o}91pA+NQ');
define('LOGGED_IN_SALT',   '.cV~h4rAHxQhiq>R-^`pF[v%v}?(iR{n?5But0R Mi43-gWKsKf5xW<Sy1Et+de$');
define('NONCE_SALT',       'f+C)kZXaYy*wKWjjeV;(!_OI4 9.Yh~pd5RBgZK]R{c2I=0Q_F3Hb0M`TGy(>/s_');

/**#@-*/

/**
 * WordPress データベーステーブルの接頭辞
 *
 * それぞれにユニーク (一意) な接頭辞を与えることで一つのデータベースに複数の WordPress を
 * インストールすることができます。半角英数字と下線のみを使用してください。
 */
$table_prefix  = 'pg_';

/**
 * 開発者へ: WordPress デバッグモード
 *
 * この値を true にすると、開発中に注意 (notice) を表示します。
 * テーマおよびプラグインの開発者には、その開発環境においてこの WP_DEBUG を使用することを強く推奨します。
 *
 * その他のデバッグに利用できる定数については Codex をご覧ください。
 *
 * @link http://wpdocs.osdn.jp/WordPress%E3%81%A7%E3%81%AE%E3%83%87%E3%83%90%E3%83%83%E3%82%B0
 */
define('WP_DEBUG', false);

/* 編集が必要なのはここまでです ! WordPress でブログをお楽しみください。 */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
