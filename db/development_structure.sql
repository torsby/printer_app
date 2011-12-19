CREATE TABLE "carts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "line_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "product_id" integer, "cart_id" integer, "created_at" datetime, "updated_at" datetime, "quantity" integer DEFAULT 1);
CREATE TABLE "order_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "book_id" integer, "order_id" integer, "price" float, "amount" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "orders" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255), "phone_number" varchar(255), "ship_to_first_name" varchar(255), "ship_to_last_name" varchar(255), "ship_to_address" varchar(255), "ship_to_city" varchar(255), "ship_to_postal_code" varchar(255), "ship_to_country" varchar(255), "customer_ip" varchar(255), "status" varchar(255), "error_message" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "products" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "manufacturer" varchar(255), "description" text, "price" float, "features" text, "created_at" datetime, "updated_at" datetime, "image" varchar(255), "user_id" integer);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "sessions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "session_id" varchar(255) NOT NULL, "data" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "email" varchar(255), "hashed_password" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_sessions_on_session_id" ON "sessions" ("session_id");
CREATE INDEX "index_sessions_on_updated_at" ON "sessions" ("updated_at");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20110503202111');

INSERT INTO schema_migrations (version) VALUES ('20110426004903');

INSERT INTO schema_migrations (version) VALUES ('20110505024847');

INSERT INTO schema_migrations (version) VALUES ('20110505025115');

INSERT INTO schema_migrations (version) VALUES ('20110505034654');

INSERT INTO schema_migrations (version) VALUES ('20110505041134');

INSERT INTO schema_migrations (version) VALUES ('20110505185406');

INSERT INTO schema_migrations (version) VALUES ('20110505185819');

INSERT INTO schema_migrations (version) VALUES ('20110507104903');

INSERT INTO schema_migrations (version) VALUES ('20110507113906');

INSERT INTO schema_migrations (version) VALUES ('20110529163232');

INSERT INTO schema_migrations (version) VALUES ('20110529165941');