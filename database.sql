-- USER is a reserved keyword with Postgres
-- You must use double quotes in every query that user is in:
-- ex. SELECT * FROM "user";
-- Otherwise you will have errors!
-- CREATE TABLE "user" (
--     "id" SERIAL PRIMARY KEY,
--     "username" VARCHAR (80) UNIQUE NOT NULL,
--     "password" VARCHAR (1000) NOT NULL
-- );



-- Katie's Database build:

--I MADE THIS TABLE AS AN ALTERNATIVE TO THE "user" TABLE IF WE START FROM SCRATCH
--If we use passport, we may have to have a user table as well, though:
--CREATE TABLE "operators" (
--	"id" SERIAL PRIMARY KEY,
--	"username" VARCHAR(80) UNIQUE NOT NULL,
--	"password" VARCHAR(1000) NOT NULL,
--	"name" VARCHAR(250) NOT NULL
--);

CREATE TABLE "user" (
    "id" SERIAL PRIMARY KEY,
    "username" VARCHAR (80) UNIQUE NOT NULL,
    "password" VARCHAR (1000) NOT NULL,
    "name" VARCHAR(250) NOT NULL
);

CREATE TABLE "clients" (
	"id" SERIAL PRIMARY KEY,
	"contact_name" VARCHAR(255),
	"company_name" VARCHAR(255)
);

CREATE TABLE "operator_clients" (
	"id" SERIAL PRIMARY KEY,
	"operator_id" INTEGER REFERENCES "user",
	"client_id" INTEGER REFERENCES "clients"
);

CREATE TABLE "client_assessments" (
	"id" SERIAL PRIMARY KEY,
	"client_id" INTEGER REFERENCES "clients",
	"engagement_date" DATE,
	"status" VARCHAR(255)
);

CREATE TABLE "buckets" (
	"id" SERIAL PRIMARY KEY,
	"bucket_index" INTEGER,
	"name" VARCHAR(255)
);

CREATE TABLE "functions" (
	"id" SERIAL PRIMARY KEY,
	"buckets_id" INTEGER REFERENCES "buckets",
	"function_index" INTEGER,
	"name" VARCHAR(255)
);

CREATE TABLE "subfunctions" (
	"id" SERIAL PRIMARY KEY,
	"functions_id" INTEGER REFERENCES "functions",
	"subfunction_index" INTEGER,
	"name" VARCHAR(255),
	"level_rating_criteria" VARCHAR
);
	

CREATE TABLE "assessment_items" (
	"id" SERIAL PRIMARY KEY,
	"assessment_id" INTEGER REFERENCES "client_assessments",
	"subfunctions_id" INTEGER REFERENCES "subfunctions",
	"functions_id" INTEGER REFERENCES "functions",
	"buckets_id" INTEGER REFERENCES "buckets",
	"level_rating" INTEGER,
	"findings" VARCHAR,
	"impact" VARCHAR,
	"reccomendations" VARCHAR,
	"phase" INTEGER
);

CREATE TABLE "buckets_headlines" (
	"id" SERIAL PRIMARY KEY,
	"assessment_id" INTEGER REFERENCES "client_assessments",
	"buckets_id" INTEGER REFERENCES "buckets",
	"headline_text" VARCHAR(255)
);

CREATE TABLE "tags" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(255)
);

CREATE TABLE "tags_assessment_items" (
	"id" SERIAL PRIMARY KEY,
	"assessments_items_id" INTEGER REFERENCES "assessment_items",
	"tags_id" INTEGER REFERENCES "tags"
);

	
DROP TABLE "user";
DROP TABLE "clients";
DROP TABLE "operator_clients";
DROP TABLE "client_assessements";
DROP TABLE "buckets";
DROP TABLE "functions";
DROP TABLE "subfunctions";
DROP TABLE "assessment_items";
DROP TABLE "buckets_headlines";
DROP TABLE "tags";
DROP TABLE "tags_assessment_items";

