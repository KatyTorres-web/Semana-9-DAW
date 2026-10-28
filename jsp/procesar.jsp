<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    if (!"POST".equals(request.getMethod())) {
        response.setStatus(405);
        out.print("Metodo no permitido");
        return;
    }

    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");

    if (nombre != null) {
        nombre = nombre.trim();
    }

    if (nombre == null || nombre.isEmpty()
            || correo == null
            || !correo.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
        response.setStatus(400);
        out.print("Datos invalidos");
        return;
    }

    session.setAttribute("nombre", nombre);

    String nombreSeguro = nombre.replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
        .replace("\"", "&quot;")
        .replace("'", "&#39;");

    String correoSeguro = correo.replace("&", "&amp;")
        .replace("<", "&lt;")
        .replace(">", "&gt;")
        .replace("\"", "&quot;")
        .replace("'", "&#39;");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">
    <title>Resultado JSP</title>
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

        .result-card {
            width: min(100%, 520px);
            padding: 40px;
            border: 1px solid rgba(255, 255, 255, 0.8);
            border-radius: 24px;
            background: rgba(255, 255, 255, 0.94);
            box-shadow: 0 24px 60px rgba(30, 64, 175, 0.14);
        }

        .status {
            display: inline-block;
            margin: 0 0 18px;
            padding: 7px 12px;
            border-radius: 999px;
            background: #dcfce7;
            color: #166534;
            font-size: 0.82rem;
            font-weight: 700;
        }

        h1 {
            margin: 0;
            font-size: clamp(1.6rem, 5vw, 2rem);
            line-height: 1.2;
        }

        .intro {
            margin: 12px 0 26px;
            color: #64748b;
            line-height: 1.6;
        }

        .data-list {
            margin: 0;
            padding: 0;
        }

        .data-item {
            margin-top: 12px;
            padding: 15px 16px;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            background: #f8fafc;
            overflow-wrap: anywhere;
        }

        dt {
            margin-bottom: 5px;
            color: #64748b;
            font-size: 0.82rem;
            font-weight: 600;
        }

        dd {
            margin: 0;
            color: #172554;
            font-weight: 600;
        }

        .session-note {
            margin: 20px 0;
            color: #475569;
            font-size: 0.92rem;
        }

        .actions {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }

        .button {
            display: inline-flex;
            min-height: 44px;
            align-items: center;
            justify-content: center;
            padding: 11px 16px;
            border: 1px solid #cbd5e1;
            border-radius: 10px;
            color: #334155;
            font-weight: 700;
            text-decoration: none;
            transition: box-shadow 160ms ease, transform 160ms ease;
        }

        .button-primary {
            border-color: transparent;
            background: linear-gradient(100deg, #4f46e5, #2563eb);
            color: #fff;
        }

        .button:hover {
            box-shadow: 0 8px 18px rgba(79, 70, 229, 0.18);
            transform: translateY(-1px);
        }

        .button:focus-visible {
            outline: 3px solid #a5b4fc;
            outline-offset: 3px;
        }

        @media (max-width: 480px) {
            .result-card {
                padding: 30px 24px;
            }

            .actions {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <main class="result-card">
        <p class="status">Registro completado</p>
        <h1>Datos procesados correctamente</h1>
        <p class="intro">La información se recibió y guardó en tu sesión.</p>

        <dl class="data-list">
            <div class="data-item">
                <dt>Nombre</dt>
                <dd><%= nombreSeguro %></dd>
            </div>
            <div class="data-item">
                <dt>Correo electrónico</dt>
                <dd><%= correoSeguro %></dd>
            </div>
        </dl>

        <p class="session-note">El nombre se guardó en la sesión.</p>

        <nav class="actions" aria-label="Acciones">
            <a class="button button-primary" href="sesion.jsp">Verificar sesión</a>
            <a class="button" href="index.jsp">Volver al formulario</a>
        </nav>
    </main>
</body>
</html>