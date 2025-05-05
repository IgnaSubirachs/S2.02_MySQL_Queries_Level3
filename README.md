
# 📘 SQL Query Project – Level 3

## 📄 Description – Exercise Statement

This project consists of solving a set of SQL queries based on two different relational databases: `tienda` (store) and `universidad` (university).  
The goal was to practice a wide range of SQL techniques including basic selection, filtering, ordering, joins, aggregations, and subqueries.

To reach **Level 3**, the following conditions had to be fulfilled:
- Complete more than **56 correct queries**.
- At least **20 of them** must be based on the **`universidad`** database.

The final submission includes **66 well-commented SQL queries** divided between both databases.

---

## 💻 Technologies Used

- **MySQL 8.x** – Relational database management system
- **Docker** – For local MySQL container setup
- **DBeaver** – SQL client for database management
- **Python** – For generating the final `.sql` and `.pdf` files
- **FPDF (Python library)** – To generate PDF documentation
- **Git & GitHub** – Version control and repository hosting

---

## 📋 Requirements

To run and test this project locally, make sure you have the following installed:

- Docker & Docker Compose
- MySQL client (or DBeaver)
- Python 3.10+ (optional, for documentation generation)
- Basic Git setup (optional, for version control)

---

## 🛠️ Installation

1. Clone this repository:

```bash
git clone https://github.com/your-username/sql-query-project.git
cd sql-query-project
```

2. Start a local MySQL Docker container (example `docker-compose.yml` is provided if needed).

3. Import the databases using the provided SQL schema files:

```bash
docker exec -i <mysql-container-name> mysql -u root -p < schema_tienda.sql
docker exec -i <mysql-container-name> mysql -u root -p < schema_universidad.sql
```

---

## ▶️ Execution

1. Open DBeaver or your preferred SQL editor.

2. Connect to your MySQL server and make sure both databases (`tienda`, `universidad`) are visible.

3. Open and run the file `final_66_queries.sql`.

4. Each query is commented in English and can be executed independently.

---

📁 Files included:

- `final_66_queries.sql` – Contains all 66 SQL queries with English descriptions.
- `SQL_Explanation_Level3.pdf` – Documentation explaining SQL techniques used.
- `schema_tienda.sql` – Schema and data for the 'tienda' database.
- `schema_universidad.sql` – Schema and data for the 'universidad' database.

---

✔️ Project completed to meet Level 3 criteria with full coverage of required queries and techniques.
