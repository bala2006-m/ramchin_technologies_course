const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const bodyParser = require('body-parser');

const app = express();
app.use(cors());
app.use(bodyParser.json());

// ✅ MySQL Connection
const db = mysql.createConnection({
  host: 'in-mum-web1837.main-hosting.eu',
  user: 'u352185981_ramchintech',
  password: 'Ramchin@123',
  database: 'u352185981_rschools'
});

db.connect((err) => {
  if (err) {
    console.error('❌ MySQL connection failed:', err);
  } else {
    console.log('✅ Connected to MySQL database');
  }
});

// 📥 POST route to register user
app.post('/register', (req, res) => {
  const { name, email, mobile, courseName, amount, paymentStatus } = req.body;

  const sql = `
    INSERT INTO registrations (name, email, mobile, course_name, amount, payment_status)
    VALUES (?, ?, ?, ?, ?, ?)
  `;

  db.query(
    sql,
    [name, email, mobile, courseName, amount, paymentStatus],
    (err, result) => {
      if (err) {
        console.error('❌ Insert error:', err);
        return res.status(500).json({ message: 'Database error' });
      }
      res.status(201).json({ message: 'Registration saved', id: result.insertId });
    }
  );
});

// 🚀 Start the server
const PORT = 5000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
});
