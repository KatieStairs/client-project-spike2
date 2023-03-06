I changed the database name in servers/modules/pool.js to nextLevel. Made a db in Postico called nextLevel and built out the tables. 

I named everything exactly as it is named in our scope doc, with the exceptions listed below.

—I had use “user” instead of “operators” table, because otherwise, I’d have to change everything from “user” to “operators” in the prime-solo-project template, but I added the “name” column to “user” and everything is fine. 
	—Maybe we should change that to save us some headache? Or are we starting this project truly from scratch? I wrote the SQL to create the alternative “operators” table as well. It is marked as alternative at the top of the page. I modeled the VARCHAR limits to the “user” table though, not the DB DESIGNER character numbers. We can change that, of course. 

— In the assessment_items table the assessment_id is set to VARCHAR(255), but the line references the client_assessments table and the “buckets_headlines” table. I had the id in the assessments_items table reference the id of the client_assessments table and made it an integer.

— In the assessement_items table the “phase” column says Integer(255). In my table, I just said INTEGER.