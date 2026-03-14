# Panduan Setup Latihan DEC SQL (Windows)

Panduan singkat untuk menyiapkan lingkungan kerja per minggu di Windows sebelum menjalankan file SQL di GitHub.

---

## Week 1 – PostgreSQL + DBeaver

### 1. Pastikan PostgreSQL sudah berjalan
- Jika menggunakan PostgreSQL lokal:
  - Pastikan service PostgreSQL berjalan (melalui `Services` di Windows, cari `postgresql`).  
  - Catat:
    - Host: `localhost` atau `127.0.0.1`
    - Port: biasanya `5432`
    - Username & password dari installasi.

### 2. Buka DBeaver di Windows
- Buka aplikasi **DBeaver**.
- Klik **“New Database Connection”** → pilih **PostgreSQL**.

### 3. Buat koneksi
Isi:
- Host: `localhost`  
- Port: `5432`  
- Database: nama database yang sudah dibuat (misal `postgres`)  
- Username: `postgres` (default) atau sesuai setup  
- Password: isi sesuai yang kamu buat.

Tekan **Test Connection** → lalu **Finish**.

### 4. Jalankan skema & query
- Buka file `week1-postgresql/schema_create.sql` di GitHub.  
- Salin semua isi → tempel di tab SQL editor DBeaver → klik **Execute**.  
- Buka `week1-postgresql/practice_basic.sql` dan `practice_advanced.sql`, lalu coba eksekusi di DBeaver.

---

## Week 2 – BigQuery

### 1. Akses Google Cloud Console
- Buka browser → `https://console.cloud.google.com/`  
- Login dengan akun Google kamu.
- Pastikan project sudah aktif dan **BigQuery** sudah di‑enable.

### 2. Buka BigQuery UI
- Di menu kiri, klik **BigQuery** → pilih project yang digunakan untuk latihan DEC.

### 3. Jalankan query
- Buka file `week2-bigquery/query_simple.sql` dan `week2-bigquery/query_complex.sql` di GitHub.  
- Salin isi query satu per satu → tempel di **Query Editor** BigQuery → klik **Run**.

---

## Week 3 – SQL Server + SSMS

### 1. Pastikan SQL Server sudah berjalan
- Pastikan service **SQL Server (MSSQLSERVER)** berjalan di Windows Services.  
- Catat:
  - Server name: biasanya `localhost` atau `.\SQLEXPRESS` (tergantung instalasi).

### 2. Buka SQL Server Management Studio (SSMS)
- Jalankan **SSMS** dari Start Menu.  
- Di halaman login:
  - Server type: `Database Engine`  
  - Server name: `localhost` atau `.\SQLEXPRESS`  
  - Authentication: `SQL Server Authentication` atau `Windows Authentication` sesuai setup.  
  - Masukkan username & password jika menggunakan SQL Authentication.

Klik **Connect**.

### 3. Jalankan skema & query
- Buka file `week3-sqlserver/schema_create.sql` di GitHub.  
- Salin isi → tempel di tab baru di SSMS → klik **Execute** untuk membuat tabel.  
- Buka `week3-sqlserver/practice_basic.sql` dan `practice_advanced.sql`, lalu coba eksekusi di SSMS.

---

## Catatan Umum
- Pastikan semua service database (PostgreSQL, SQL Server) benar‑benar running sebelum membuka DBeaver / SSMS.  
- Jika query error, cek:
  - Nama database, tabel, dan kolom sudah sesuai dengan skema di `schema_create.sql`.  
  - Koneksi ke database sudah berhasil di‑test di DBeaver / SSMS.
