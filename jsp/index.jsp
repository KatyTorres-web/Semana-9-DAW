<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>Laboratorio 09 - JSP</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            min-height: 100vh;
            margin: 0;
            padding: 24px;
            display: grid;
            place-items: center;
            background: linear-gradient(135deg, #e0f2fe, #eef2ff 55%, #f5f3ff);
            color: #172554;
            font-family: "Segoe UI", Arial, sans-serif;
        }

        .form-card {
            width: min(100%, 460px);
            padding: 40px;
            border: 1px solid rgba(255, 255, 255, 0.8);
            border-radius: 24px;
            background: rgba(255, 255, 255, 0.92);
            box-shadow: 0 24px 60px rgba(30, 64, 175, 0.14);
        }

        .eyebrow {
            margin: 0 0 10px;
            color: #4f46e5;
            font-size: 0.78rem;
            font-weight: 700;
            letter-spacing: 0.12em;
            text-transform: uppercase;
        }

        h1 {
            margin: 0;
            color: #172554;
            font-size: clamp(1.7rem, 5vw, 2.1rem);
            line-height: 1.2;
        }

        .description {
            margin: 12px 0 30px;
            color: #64748b;
            line-height: 1.6;
        }

        form {
            display: grid;
            gap: 10px;
        }

        label {
            margin-top: 8px;
            color: #334155;
            font-size: 0.92rem;
            font-weight: 600;
        }

        input {
            width: 100%;
            padding: 13px 15px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            background: #fff;
            color: #172554;
            font: inherit;
            transition: border-color 160ms ease, box-shadow 160ms ease;
        }

        input::placeholder {
            color: #94a3b8;
        }

        input:focus {
            border-color: #6366f1;
            outline: none;
            box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.15);
        }

        button {
            margin-top: 16px;
            padding: 14px 18px;
            border: 0;
            border-radius: 10px;
            background: linear-gradient(100deg, #4f46e5, #2563eb);
            color: #fff;
            cursor: pointer;
            font: inherit;
            font-weight: 700;
            transition: box-shadow 160ms ease, transform 160ms ease;
        }

        button:hover {
            box-shadow: 0 10px 22px rgba(79, 70, 229, 0.25);
            transform: translateY(-1px);
        }

        button:focus-visible {
            outline: 3px solid #a5b4fc;
            outline-offset: 3px;
        }

        @media (max-width: 480px) {
            .form-card {
                padding: 30px 24px;
            }
        }
    </style>
</head>
<body>
    <main class="form-card">
        <p class="eyebrow">Laboratorio 09 · JSP</p>
        <h1>Formulario de registro</h1>
        <p class="description">Desarrollo de Aplicaciones Web · Semana 09</p>

        <form action="procesar.jsp" method="POST">
            <label for="nombre">Nombre</label>
            <input type="text" id="nombre" name="nombre"
                   placeholder="Escribe tu nombre" autocomplete="name" required>

            <label for="correo">Correo electrónico</label>
            <input type="email" id="correo" name="correo"
                   placeholder="nombre@ejemplo.com" autocomplete="email" required>

            <button type="submit">Enviar datos</button>
        </form>
    </main>
</body>
</html>