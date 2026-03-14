# DEC SQL Practice – Basic to Advanced

In‑live SQL basic–advanced practice from **Data Enthusiast Community (DEC)**, organized by week and database engine.

**OS:** Windows  
**Database per minggu:**  
• Week 1: PostgreSQL + DBeaver  
• Week 2: BigQuery  
• Week 3: SQL Server + SSMS  

## 📊 Skill Matrix

| Week | Engine | Dataset | Key Features |
|------|--------|---------|--------------|
| 1 | PostgreSQL | trackers_detail.csv, fitness_trackers.csv | JOIN, CTE, Window Functions |
| 2 | BigQuery | supermarket.csv | ROW_NUMBER(), CASE, Complex Aggregations |
| 3 | SQL Server | supermarket.csv | CREATE VIEW, Advanced CTE, SSMS |

## 📁 Struktur Folder

**dataset/** ✅ LIVE  
├─ trackers_detail.csv  
├─ fitness_trackers.csv  
└─ supermarket.csv  

**notes/** ✅ LIVE  
└─ how_to_setup.md  

**week1-postgresql/** ✅ LIVE  
├─ schema_create.sql  
├─ practice_basic.sql  
└─ practice_advanced.sql  

**week2-bigquery/** ✅ LIVE  
├─ schema-note.md  
├─ bqsimple_query.sql  
└─ bqadvance_query.sql  

**week3-sqlserver/** ✅ LIVE  
├─ schema_note.md  
├─ view_note.md  
├─ sqlserver_simple_query.sql  
└─ sqlserver_advanced.sql  

**README.md** ✅ LIVE

## 🚀 Quick Start Guide

**PostgreSQL (Week 1):**  
COPY fitness_trackers FROM '/path/to/fitness_trackers.csv' WITH CSV HEADER;

**BigQuery (Week 2):**  
SELECT * FROM `your-project.dataset.supermarket` LIMIT 10;

**SQL Server (Week 3):**  
BULK INSERT supermarket FROM 'C:\temp\supermarket.csv';

## 🎯 Skills Demonstrated
**BASIC:** SELECT, WHERE, GROUP BY, ORDER BY, LIMIT  
**INTERMEDIATE:** JOIN, Subquery, CASE WHEN, Aggregations  
**ADVANCED:** CTE, Window Functions (ROW_NUMBER, RANK), CREATE VIEW  
**CROSS-ENGINE:** PostgreSQL ↔ BigQuery ↔ SQL Server

## 👤 Author
**Ronald Ricardo Tambunan**  
💼 [LinkedIn](https://linkedin.com/in/ronaldrt) | 📧 [rricardot7@gmail.com](mailto:rricardot7@gmail.com)

---
⭐ **Star this repo if helpful!**  
🔗 **[Live Demo](https://github.com/ronaldricardo/dec-sql-practice-class)**
