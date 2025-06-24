<?php
session_start();

require_once "config/database.php";

require_once "models/User.php";
require_once "models/Event.php";
require_once "models/Cart.php";

require_once "controllers/AuthController.php";
require_once "controllers/EventController.php";
require_once "controllers/CartController.php";

$rota = $_GET['rota'] ?? 'login';

$userModel = new User($pdo);
$eventModel = new Event($pdo);
$cartModel = new Cart($pdo);

$authController = new AuthController($userModel);
$eventController = new EventController($eventModel);
$cartController = new CartController($cartModel);

// Roteamento simples
switch ($rota) {
    case 'login':
        $authController->login();
        break;
    case 'cadastrar':
        $authController->cadastro();
        break;
    case 'sair':
        $authController->logout();
        break;
    case 'home':
        $eventController->home();
        break;
    case 'criar-evento':
        $eventController->criar();
        break;
    case 'editar-evento':
        $eventController->editar();
        break;
    case 'excluir-evento':
        $eventController->excluir();
        break;
    case 'add-carrinho':
        $cartController->adicionar();
        break;
    case 'meu-carrinho':
        $cartController->listar();
        break;
    case 'remover-carrinho':
        $cartController->remover();
        break;
    default:
        header("Location: index.php?rota=login");
        exit;
}
