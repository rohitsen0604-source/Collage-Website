const fs = require('fs');
const path = require('path');

async function main() {
  let mysql;
  try {
    mysql = require('mysql2/promise');
  } catch (e) {
    console.error('\n❌ mysql2 package not found. Please install it first:\n   npm install mysql2\n');
    process.exit(1);
  }

  const password = process.argv[2] || process.env.DB_PASS;
  if (!password) {
    console.log('\n❌ Password zaroori hai!');
    console.log('Usage: node import_to_aiven.js <YOUR_AIVEN_PASSWORD>\n');
    process.exit(1);
  }

  const host = 'mysql-155eaacb-rohitsen0604-7acc.b.aivencloud.com';
  const port = 24024;
  const user = 'avnadmin';
  const database = 'defaultdb';

  console.log(`\n⏳ Connecting to Aiven MySQL (${host}:${port})...`);

  try {
    const connection = await mysql.createConnection({
      host,
      port,
      user,
      password,
      database,
      ssl: {
        rejectUnauthorized: false
      },
      multipleStatements: true
    });

    console.log('✅ Connected to Aiven MySQL successfully!');

    // Try disabling sql_require_primary_key for this session if supported
    try {
      await connection.query("SET SESSION sql_require_primary_key = 0;");
    } catch (e) {
      // Ignore if not permitted, our SQL already has inline primary keys
    }

    const sqlFilePath = path.join(__dirname, 'college_website', 'database', 'college_website_db.sql');
    console.log(`📖 Reading SQL file: ${sqlFilePath}`);
    const sqlContent = fs.readFileSync(sqlFilePath, 'utf8');

    console.log('🚀 Executing SQL queries to create tables and insert data...');
    await connection.query(sqlContent);

    console.log('🎉 Database successfully imported into Aiven (defaultdb)!\n');
    await connection.end();
  } catch (err) {
    console.error('\n❌ Import failed:', err.message);
  }
}

main();
