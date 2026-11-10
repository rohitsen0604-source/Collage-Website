<?php 

$host = getenv('DB_HOST') ?: 'localhost';
$user = getenv('DB_USER') ?: 'root';
$pass = getenv('DB_PASS') !== false ? getenv('DB_PASS') : (getenv('DB_PASSWORD') !== false ? getenv('DB_PASSWORD') : '');
$db   = getenv('DB_NAME') ?: 'college_website_db';
$port = (int)(getenv('DB_PORT') ?: 3306);

$conn = mysqli_init();

// Support SSL connection for Cloud MySQL providers like Aiven
if ($host !== 'localhost' && $host !== '127.0.0.1') {
    // Disable strict cert verification so ca.pem is not required, while maintaining SSL encryption
    $conn->options(MYSQLI_OPT_SSL_VERIFY_SERVER_CERT, false);
    $conn->options(MYSQLI_OPT_CONNECT_TIMEOUT, 10);
    $conn->ssl_set(NULL, NULL, NULL, NULL, NULL);
    $connected = @$conn->real_connect($host, $user, $pass, $db, $port, NULL, MYSQLI_CLIENT_SSL);
} else {
    $conn->options(MYSQLI_OPT_CONNECT_TIMEOUT, 10);
    $connected = @$conn->real_connect($host, $user, $pass, $db, $port);
}

if (!$connected) {
    die("Database connection failed: " . mysqli_connect_error());
}
