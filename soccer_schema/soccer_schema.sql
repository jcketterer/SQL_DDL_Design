
CREATE TABLE "Teams" (
    "id" INT   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    "city" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "id"
     ) 
);

CREATE TABLE "Refs" (
    "id" INT   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Refs" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Result" (
    "id" INT   NOT NULL,
    "team_id" INT   NOT NULL,
    "match_id" INT   NOT NULL,
    "match_result" VARCHAR(10)   NOT NULL,
    CONSTRAINT "pk_Result" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Fixtures" (
    "id" INT   NOT NULL,
    "home_team_id" INT   NOT NULL,
    "away_team_id" INT   NOT NULL,
    "location" VARCHAR(50)   NOT NULL,
    "date" DATE   NOT NULL,
    "start_time" TEXT   NOT NULL,
    "season_id" INT   NOT NULL,
    "head_ref" INT   NOT NULL,
    "assistent_ref1_id" INT   NOT NULL,
    "assistent_ref2_id" INT   NOT NULL,
    CONSTRAINT "pk_Fixtures" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Player" (
    "id" INT   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    "birthday" DATE   NOT NULL,
    "height" VARCHAR(10)   NOT NULL,
    "current_team_id" INT   NOT NULL,
    CONSTRAINT "pk_Player" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goal" (
    "id" INT   NOT NULL,
    "player_id" INT   NOT NULL,
    "match_id" INT   NOT NULL,
    CONSTRAINT "pk_Goal" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "LineUp" (
    "id" INT   NOT NULL,
    "player_id" INT   NOT NULL,
    "match_id" INT   NOT NULL,
    "team_id" INT   NOT NULL,
    CONSTRAINT "pk_LineUp" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Season" (
    "id" INT   NOT NULL,
    "start_date" DATE   NOT NULL,
    "end_date" DATE   NOT NULL,
    CONSTRAINT "pk_Season" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Result" ADD CONSTRAINT "fk_Result_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Fixtures" ADD CONSTRAINT "fk_Fixtures_home_team_id" FOREIGN KEY("home_team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Fixtures" ADD CONSTRAINT "fk_Fixtures_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Fixtures" ADD CONSTRAINT "fk_Fixtures_season_id" FOREIGN KEY("season_id")
REFERENCES "Season" ("id");

ALTER TABLE "Fixtures" ADD CONSTRAINT "fk_Fixtures_head_ref" FOREIGN KEY("head_ref")
REFERENCES "Refs" ("id");

ALTER TABLE "Fixtures" ADD CONSTRAINT "fk_Fixtures_assistent_ref1_id" FOREIGN KEY("assistent_ref1_id")
REFERENCES "Refs" ("id");

ALTER TABLE "Fixtures" ADD CONSTRAINT "fk_Fixtures_assistent_ref2_id" FOREIGN KEY("assistent_ref2_id")
REFERENCES "Refs" ("id");

ALTER TABLE "Player" ADD CONSTRAINT "fk_Player_current_team_id" FOREIGN KEY("current_team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Goal" ADD CONSTRAINT "fk_Goal_player_id" FOREIGN KEY("player_id")
REFERENCES "Player" ("id");

ALTER TABLE "Goal" ADD CONSTRAINT "fk_Goal_match_id" FOREIGN KEY("match_id")
REFERENCES "Fixtures" ("id");

ALTER TABLE "LineUp" ADD CONSTRAINT "fk_LineUp_player_id" FOREIGN KEY("player_id")
REFERENCES "Player" ("id");

ALTER TABLE "LineUp" ADD CONSTRAINT "fk_LineUp_match_id" FOREIGN KEY("match_id")
REFERENCES "Fixtures" ("id");

ALTER TABLE "LineUp" ADD CONSTRAINT "fk_LineUp_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

