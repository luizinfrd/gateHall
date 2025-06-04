<?php
class Database {
    private static $PDO;
    public static function getConnection() {
        if (!self::$PDO) {
            $dsn = 'mysql:host=localhost;dbname=gatehall';
            $username = 'root';
            $password = '';

            try {
                self::$PDO = new PDO($dsn, $username, $password);
                self::$PDO->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            } catch (PDOException $e) {
                die('Conexão falhou: ' . $e->getMessage());
            }
        }
        return self::$PDO;
    }
}
?>