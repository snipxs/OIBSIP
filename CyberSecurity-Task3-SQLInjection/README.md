# Task 3: SQL Injection on DVWA (Low Security)

##  Project Overview

This project demonstrates a classic SQL Injection (SQLi) vulnerability by exploiting the login and input forms of the **Damn Vulnerable Web Application (DVWA)**. The objective is to understand how improperly sanitized user input can manipulate backend database queries, resulting in unauthorized data exposure.

---

##  Environment Setup

| Component | Details |
|---|---|
| **Target Environment** | DVWA hosted locally on Metasploitable 2 (Isolated Virtual Machine) |
| **Attacker Machine** | Kali Linux / Host Machine Web Browser |
| **Security Level** | DVWA set to `Low` |

---

##  What is SQL Injection?

SQL Injection is a code injection technique that can destroy your database. It occurs when malicious SQL statements are inserted into entry fields for execution (e.g., dumping database contents to the attacker). In a successful attack, an attacker can:

- Bypass authentication
- Access, modify, or delete data within the database

### Why Do These Payloads Work?

In a vulnerable application, the developer takes user input and concatenates it directly into the database query. For example:

```sql
SELECT first_name, last_name FROM users WHERE user_id = '$id';
```

If an attacker inputs `' OR '1'='1`, the final query becomes:

```sql
SELECT first_name, last_name FROM users WHERE user_id = '' OR '1'='1';
```

Because `1=1` is always mathematically true, the database ignores the original ID requirement and returns **every single row** in the users table.

---

##  Remediation & Prevention

To fix this vulnerability, developers must stop concatenating raw user input into SQL commands. The industry-standard prevention method is using **Parameterized Queries (Prepared Statements)**.

With prepared statements, the database treats user input strictly as **data** (a literal string), not as executable code. Even if an attacker types `' OR '1'='1`, the database will safely search for a user whose literal ID matches that exact string — preventing the injection payload from executing.

---

##  Repository Contents

| File | Description |
|---|---|
| `sql_injection_notes.md` | Log of payloads used and specific data exposed |
| `/SQLi_Screenshots` | Visual evidence of successful payload execution and data extraction |
