
CREATE TABLE "Doctors" (
    "id" INT   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    "specialty" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Visits" (
    "id" INT   NOT NULL,
    "doctor_id" INT   NOT NULL,
    "patient_id" INT   NOT NULL,
    "date" DATE   NOT NULL,
    CONSTRAINT "pk_Visits" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patients" (
    "id" INT   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    "insurance" VARCHAR(50)   NOT NULL,
    "birthday" DATE   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diseases" (
    "id" INT   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    "description" TEXT   NOT NULL,
    CONSTRAINT "pk_Diseases" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Diagnosis" (
    "id" INT   NOT NULL,
    "visit_id" INT   NOT NULL,
    "disease_id" INT   NOT NULL,
    "notes" TEXT   NOT NULL,
    CONSTRAINT "pk_Diagnosis" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctors" ("id");

ALTER TABLE "Visits" ADD CONSTRAINT "fk_Visits_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("id");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_visit_id" FOREIGN KEY("visit_id")
REFERENCES "Visits" ("id");

ALTER TABLE "Diagnosis" ADD CONSTRAINT "fk_Diagnosis_disease_id" FOREIGN KEY("disease_id")
REFERENCES "Diseases" ("id");

