Names: IMPUNDU GATERA Brazia
ID: 29057
Group: D

E-Waste Collection & Processing – PL/SQL Problem

This small demonstration shows how to use PL/SQL Collections, Records, and GOTO statements through a simple scenario of handling electronic waste items.
I chose this topic because e-waste is a real-life problem, and it makes the PL/SQL features easy to understand.

📌 Project Idea

An e-waste center receives different items like phones, batteries, and chargers.
Some items come in with missing details or wrong data, so the system must:

store item details,

skip invalid rows,

load valid items into a collection,

total the weight of each category,

and show the results clearly.

This demonstrates exactly what the assignment asked for:

Records → storing one item

Collections → storing many items

GOTO → skipping invalid entries

📁 Repository Structure
plsql-ewaste-demo/
├── README.md
├── sql/
│   ├── create_tables.sql
│   ├── plsql_demo.sql
│   └── sample_output.txt
└── docs/
    └── assessment_checklist.md

▶️ How to Run

Open Oracle SQL Developer (or SQL*Plus).

Connect to your Oracle schema.

Run:

sql/create_tables.sql


Then run:

sql/plsql_demo.sql


Compare the output with the file in:

sql/sample_output.txt

📊 What This Project Demonstrates

A Record for one e-waste item.

An Associative Array Collection to hold all valid items.

A GOTO statement to skip invalid rows.

Data processing (weight totals).

Clean, readable documentation for assessment.

📝 Why This Project Matters

Even though the example is simple, it shows how PL/SQL can handle real-world batch processing, data validation, and structured storage.
It’s also easy for someone else to read and test — perfect for your class assessment.

💬 Submission Note (paste this for your lecturer)

Dear Instructor,

Please find my PL/SQL practicum project demonstrating Collections, Records, and the use of a GOTO statement.
The repository includes all scripts, sample data, sample output, and documentation.

Thank you.
