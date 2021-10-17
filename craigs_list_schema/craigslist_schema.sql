

CREATE TABLE "Region" (
    "id" INT   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Region" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Post" (
    "id" INT   NOT NULL,
    "title" VARCHAR(35)   NOT NULL,
    "text" TEXT   NOT NULL,
    "location" TEXT   NOT NULL,
    "user_id" INT   NOT NULL,
    "region_id" INT   NOT NULL,
    "category_id" INT   NOT NULL,
    CONSTRAINT "pk_Post" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "User" (
    "id" INT   NOT NULL,
    "username" VARCHAR(25)   NOT NULL,
    "encrypted_password" VARCHAR(50)   NOT NULL,
    "preferred_region_id" INT   NOT NULL,
    CONSTRAINT "pk_User" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Category" (
    "id" INT   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Category" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_user_id" FOREIGN KEY("user_id")
REFERENCES "User" ("id");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_region_id" FOREIGN KEY("region_id")
REFERENCES "Region" ("id");

ALTER TABLE "Post" ADD CONSTRAINT "fk_Post_category_id" FOREIGN KEY("category_id")
REFERENCES "Category" ("id");

