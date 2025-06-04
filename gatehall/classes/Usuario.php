<?php
class Usuario{
    private PDO $db;

    public function __construct(Database $database){
        $this->db = $database->getConnection();
    }

    public function cadastrar(string $nome, string $email, string $senha_hash, int $is_admin){
        $hash = password_hash($senha_hash, PASSWORD_DEFAULT);
        $sql = "INSERT INTO usuario (nome, email, senha_hash, is_admin) VALUES (:nome, :email, :senha_hash, 'usuario')";
        $stmt = $this->db->prepare($sql);

        return $stmt->execute([$nome,
         $email,
         $senha_hash => $hash,
        ]);
    };

    public function login(string $email, string $senha_hash): ?array {
        $sql = "SELECT id, nome, email, is_admin FROM usuario WHERE id = :id";
        $stmt = $this->db->prepare($sql);
        $smt = $stmt->execute([$email, $senha_hash]);

        if ($usuario && password_verify($senha_hash, $smt->password)){

    }
} 






?>