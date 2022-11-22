BEGIN TRANSACTION;
DROP TABLE IF EXISTS "django_migrations";
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "auth_group";
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(80) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "auth_group_permissions";
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission__old"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "auth_user_groups";
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user__old"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "auth_user_user_permissions";
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission__old"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user__old"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "django_admin_log";
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type__old"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user__old"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "django_content_type";
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "auth_permission";
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
DROP TABLE IF EXISTS "auth_user";
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(30) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"last_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "movies_genre";
CREATE TABLE IF NOT EXISTS "movies_genre" (
	"id"	integer NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
DROP TABLE IF EXISTS "django_session";
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
DROP TABLE IF EXISTS "movies_movie";
CREATE TABLE IF NOT EXISTS "movies_movie" (
	"id"	integer NOT NULL,
	"title"	varchar(255) NOT NULL,
	"release_year"	integer NOT NULL,
	"number_in_stock"	integer NOT NULL,
	"daily_rate"	real NOT NULL,
	"genre_id"	integer NOT NULL,
	"date_created"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("genre_id") REFERENCES "movies_genre"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2022-11-12 14:49:35.172110'),
 (2,'auth','0001_initial','2022-11-12 14:49:35.618992'),
 (3,'admin','0001_initial','2022-11-12 14:49:36.144070'),
 (4,'admin','0002_logentry_remove_auto_add','2022-11-12 14:49:36.677485'),
 (5,'admin','0003_logentry_add_action_flag_choices','2022-11-12 14:49:37.071904'),
 (6,'contenttypes','0002_remove_content_type_name','2022-11-12 14:49:37.465881'),
 (7,'auth','0002_alter_permission_name_max_length','2022-11-12 14:49:37.859379'),
 (8,'auth','0003_alter_user_email_max_length','2022-11-12 14:49:38.412072'),
 (9,'auth','0004_alter_user_username_opts','2022-11-12 14:49:38.864917'),
 (10,'auth','0005_alter_user_last_login_null','2022-11-12 14:49:39.259831'),
 (11,'auth','0006_require_contenttypes_0002','2022-11-12 14:49:39.478784'),
 (12,'auth','0007_alter_validators_add_error_messages','2022-11-12 14:49:39.872537'),
 (13,'auth','0008_alter_user_username_max_length','2022-11-12 14:49:40.299779'),
 (14,'auth','0009_alter_user_last_name_max_length','2022-11-12 14:49:40.693897'),
 (15,'movies','0001_initial','2022-11-12 14:49:41.201240'),
 (16,'sessions','0001_initial','2022-11-12 14:49:41.693637'),
 (17,'movies','0002_movie_date_created','2022-11-12 14:57:24.656794'),
 (18,'auth','0010_alter_group_name_max_length','2022-11-18 07:31:23.412626'),
 (19,'auth','0011_update_proxy_permissions','2022-11-18 07:31:23.659784'),
 (20,'auth','0012_alter_user_first_name_max_length','2022-11-18 07:31:24.003359');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'movies','genre'),
 (8,'movies','movie');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_genre','Can add genre'),
 (26,7,'change_genre','Can change genre'),
 (27,7,'delete_genre','Can delete genre'),
 (28,7,'view_genre','Can view genre'),
 (29,8,'add_movie','Can add movie'),
 (30,8,'change_movie','Can change movie'),
 (31,8,'delete_movie','Can delete movie'),
 (32,8,'view_movie','Can view movie');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$390000$Lkmzha77unHODdPwKpTD5K$r3dJDTyXoFMEhcf9bs5cRIQMY9BfkQCFID+xs7N08es=','2022-11-18 07:32:02.888132',1,'admin','','prathamesh231197@gmail.com',1,1,'2022-11-12 15:04:25.540105','');
INSERT INTO "movies_genre" VALUES (1,'Action'),
 (2,'Comedy');
INSERT INTO "django_session" VALUES ('66rszqaej60m00h0v08ewp102vrdov5i','.eJxVjEEOwiAQRe_C2hCmZSi4dO8ZCAyDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-TuIsQJx-txjowXUH6R7qrUlqdV3mKHdFHrTLa0v8vBzu30EJvXzrMGhleEzKuhzARlRgR0NgckILDjTriECWs0Mih5AJJ0jTgKSUG1m8P8tlN0Y:1ovvr1:K75SBUQQog3jYsJ1lbyihSucWU9e_BnM3X-8TolozSM','2022-12-02 07:32:03.160909');
DROP INDEX IF EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
DROP INDEX IF EXISTS "auth_group_permissions_group_id_b120cbf9";
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
DROP INDEX IF EXISTS "auth_group_permissions_permission_id_84c5c92e";
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
DROP INDEX IF EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
DROP INDEX IF EXISTS "auth_user_groups_user_id_6a12ed8b";
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
DROP INDEX IF EXISTS "auth_user_groups_group_id_97559544";
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
DROP INDEX IF EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
DROP INDEX IF EXISTS "auth_user_user_permissions_user_id_a95ead1b";
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
DROP INDEX IF EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c";
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
DROP INDEX IF EXISTS "django_admin_log_content_type_id_c4bce8eb";
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
DROP INDEX IF EXISTS "django_admin_log_user_id_c564eba6";
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
DROP INDEX IF EXISTS "django_content_type_app_label_model_76bd3d3b_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
DROP INDEX IF EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq";
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
DROP INDEX IF EXISTS "auth_permission_content_type_id_2f476e4b";
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
DROP INDEX IF EXISTS "django_session_expire_date_a5c62663";
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
DROP INDEX IF EXISTS "movies_movie_genre_id_2b557368";
CREATE INDEX IF NOT EXISTS "movies_movie_genre_id_2b557368" ON "movies_movie" (
	"genre_id"
);
COMMIT;
