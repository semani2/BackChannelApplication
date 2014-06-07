CREATE TABLE "categories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "category_name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "comment_votes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "comment_id" integer, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "comments" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "comment_con" text, "post_id" integer, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "post_votes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "post_id" integer, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "post_title" varchar(255), "post_content" text, "category_id" integer, "user_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "tags" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "tag_name" varchar(255), "post_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "username" varchar(255), "password" varchar(255), "usertype" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_comment_votes_on_comment_id" ON "comment_votes" ("comment_id");
CREATE INDEX "index_comment_votes_on_user_id" ON "comment_votes" ("user_id");
CREATE INDEX "index_comments_on_post_id" ON "comments" ("post_id");
CREATE INDEX "index_comments_on_user_id" ON "comments" ("user_id");
CREATE INDEX "index_post_votes_on_post_id" ON "post_votes" ("post_id");
CREATE INDEX "index_post_votes_on_user_id" ON "post_votes" ("user_id");
CREATE INDEX "index_posts_on_category_id" ON "posts" ("category_id");
CREATE INDEX "index_posts_on_user_id" ON "posts" ("user_id");
CREATE INDEX "index_tags_on_post_id" ON "tags" ("post_id");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130927233824');

INSERT INTO schema_migrations (version) VALUES ('20130928001252');

INSERT INTO schema_migrations (version) VALUES ('20130928001433');

INSERT INTO schema_migrations (version) VALUES ('20130928002206');

INSERT INTO schema_migrations (version) VALUES ('20130928002458');

INSERT INTO schema_migrations (version) VALUES ('20130928002842');

INSERT INTO schema_migrations (version) VALUES ('20130929081540');