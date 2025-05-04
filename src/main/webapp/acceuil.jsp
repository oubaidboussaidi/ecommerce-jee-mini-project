<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Connexion</title>
  <style>
    body {
      background: linear-gradient(135deg, #e0f7fa, #e1f5fe);
      font-family: 'Segoe UI', sans-serif;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
    }

    .login-container {
      background: #fff;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
    }

    .login-container h2 {
      text-align: center;
      margin-bottom: 30px;
      color: #0077b6;
      font-size: 28px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-bottom: 6px;
      font-weight: 600;
      color: #333;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 16px;
      background-color: #f9f9f9;
    }

    input:focus {
      border-color: #0077b6;
      outline: none;
      background-color: #fff;
    }

    button {
      width: 100%;
      padding: 14px;
      background-color: #0077b6;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
      transition: background-color 0.3s ease;
      font-weight: bold;
      text-transform: uppercase;
    }

    button:hover {
      background-color: #023e8a;
    }

    .footer-text {
      margin-top: 20px;
      text-align: center;
      font-size: 14px;
      color: #666;
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h2>Connexion</h2>
    <form action="acceuil" method="post">
      <div class="form-group">
        <label for="login">Nom d'utilisateur</label>
        <input type="text" id="login" name="login" placeholder="Entrez votre identifiant" required>
      </div>
      <div class="form-group">
        <label for="password">Mot de passe</label>
        <input type="password" id="password" name="password" placeholder="Entrez votre mot de passe" required>
      </div>
      <button type="submit">Se connecter</button>
    </form>
    <div class="footer-text">
      realisé par oubaid
    </div>
  </div>
</body>
</html>
