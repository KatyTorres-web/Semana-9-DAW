<?php
require_once 'config.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    exit('Metodo no permitido');
}

$nombre = filter_input(INPUT_POST, 'nombre');
$correo = filter_input(
    INPUT_POST,
    'correo',
    FILTER_VALIDATE_EMAIL
);

$nombre = trim($nombre ?? '');

if ($nombre === '' || $correo === false || $correo === null) {
    http_response_code(400);
    exit('Datos invalidos');
}

$nombreSeguro = htmlspecialchars(
    $nombre,
    ENT_QUOTES,
    'UTF-8'
);

$correoSeguro = htmlspecialchars(
    $correo,
    ENT_QUOTES,
    'UTF-8'
);
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultado PHP</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            margin: 0;
            display: grid;
            place-items: center;
            padding: 24px;
            background: linear-gradient(135deg, #e0f2fe, #eef2ff 55%, #f5f3ff);
            color: #1e293b;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        main {
            width: min(100%, 460px);
            padding: 40px;
            border: 1px solid rgba(255, 255, 255, 0.8);
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.94);
            box-shadow: 0 20px 50px rgba(30, 64, 175, 0.12);
        }

        .status {
            display: inline-block;
            margin: 0 0 16px;
            padding: 7px 12px;
            border-radius: 999px;
            background: #dcfce7;
            color: #15803d;
            font-size: 0.875rem;
            font-weight: 700;
        }

        h1 {
            margin: 0 0 24px;
            color: #1d4ed8;
            font-size: clamp(1.7rem, 5vw, 2rem);
        }

        .detail {
            margin: 0 0 14px;
            padding: 14px 16px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            background: #f8fafc;
            overflow-wrap: anywhere;
        }

        .detail strong {
            display: block;
            margin-bottom: 5px;
            color: #64748b;
            font-size: 0.875rem;
        }

        a {
            display: block;
            margin-top: 24px;
            padding: 14px 18px;
            border-radius: 10px;
            background: #2563eb;
            color: white;
            font-weight: 700;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.2s, transform 0.2s;
        }

        a:hover {
            transform: translateY(-1px);
            background: #1d4ed8;
        }

        a:focus-visible {
            outline: 3px solid #93c5fd;
            outline-offset: 3px;
        }

        @media (max-width: 480px) {
            main {
                padding: 30px 24px;
            }
        }
    </style>
</head>
<body>
    <main>
        <p class="status">Registro completado</p>
        <h1>Datos procesados correctamente</h1>
        <p class="detail"><strong>Nombre</strong><?= $nombreSeguro ?></p>
        <p class="detail"><strong>Correo</strong><?= $correoSeguro ?></p>

        <a href="index.html">Volver al formulario</a>
    </main>
</body>
</html>
