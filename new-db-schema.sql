CREATE TABLE "characters" (
  "character_id" int4 NOT NULL PRIMARY KEY,
  "name" varchar(89) NOT NULL,
  "description" TEXT DEFAULT NULL,
  "img_path" TEXT DEFAULT NULL,
  "img_ext" TEXT DEFAULT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "comics" (
  "comic_id" int4 NOT NULL PRIMARY KEY,
  "digital_id" int4 NOT NULL,
  "title" varchar(144) NOT NULL,
  "description" TEXT DEFAULT NULL,
  "modified" timestamptz(6) NULL DEFAULT NULL,
  "img_path" TEXT DEFAULT NULL,
  "img_ext" TEXT DEFAULT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "creator_by_comics" (
  "creator_id" int4 NOT NULL PRIMARY KEY,
  "comic_id" int4 NOT NULL,
  "name" varchar(89) NOT NULL,
  "role" varchar(55) NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT "fk_crearor_comics" FOREIGN KEY ("comic_id") REFERENCES "comics" ("comic_id")
);

CREATE TABLE "character_by_comics" (
  "character_id" int4 NOT NULL,
  "comic_id" int4 NOT NULL,
  "created_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_at" timestamptz(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (character_id, comic_id),
  CONSTRAINT "fk_character_by_comics_character" FOREIGN KEY ("character_id") REFERENCES "characters" ("character_id") ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT "fk_character_by_comics_ccomics" FOREIGN KEY ("comic_id") REFERENCES "comics" ("comic_id") ON DELETE NO ACTION ON UPDATE NO ACTION
);