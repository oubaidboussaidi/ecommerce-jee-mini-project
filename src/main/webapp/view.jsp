<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="metier.Produit" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Produits</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to right, #ece9e6, #ffffff);
      margin: 0;
      padding: 40px 20px;
    }

    .container {
      max-width: 900px;
      margin: auto;
      background: #fff;
      padding: 40px;
      border-radius: 16px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
      color: #00695c;
      font-size: 28px;
      letter-spacing: 1px;
    }

    .tab {
      display: block;
      width: 200px;
      margin: 0 auto 30px auto;
      padding: 12px 24px;
      text-align: center;
      border: 2px solid #00695c;
      border-radius: 50px;
      color: #00695c;
      background-color: #e0f2f1;
      cursor: pointer;
      transition: all 0.3s;
    }

    .tab.active {
      background-color: #00695c;
      color: white;
    }

    .form-section {
      display: block;
      animation: fadeIn 0.4s ease;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    form {
      text-align: center;
    }

    label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
    }

    input[type="text"], input[type="number"] {
      width: 80%;
      max-width: 300px;
      padding: 10px;
      margin-bottom: 20px;
      border-radius: 8px;
      border: 1px solid #ccc;
      font-size: 16px;
    }

    button {
      padding: 12px 24px;
      border: none;
      background-color: #00695c;
      color: white;
      border-radius: 50px;
      font-weight: bold;
      cursor: pointer;
      text-transform: uppercase;
      transition: background-color 0.3s;
    }

    button:hover {
      background-color: #004d40;
    }

    table {
      width: 100%;
      margin-top: 40px;
      border-collapse: collapse;
    }

    th, td {
      border: 1px solid #ccc;
      padding: 14px;
      text-align: center;
    }

    th {
      background-color: #00695c;
      color: white;
      text-transform: uppercase;
    }

    .btn-small {
      padding: 8px 12px;
      font-size: 14px;
      margin: 0 5px;
    }

    .actions {
      display: flex;
      justify-content: center;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Gestion des Produits</h1>

    <div class="tabs">
      <div id="add-tab" class="tab active" onclick="showSection('add')">➕ Ajouter un Produit</div>
      <div id="list-tab" class="tab" onclick="showSection('list')">📋 Afficher la Liste des Produits</div>
    </div>

    <div id="add-section" class="form-section active">
      <form action="addProduit" method="post">
        <label for="nomProduit">Nom du produit</label>
        <input type="text" name="nomProduit" id="nomProduit" required>

        <label for="prix">Prix (€)</label>
        <input type="number" step="0.01" name="prix" id="prix" required>
        <br>
        <button type="submit">Ajouter</button>
      </form>
    </div>

    <div id="list-section" class="form-section" style="display:none;">
      <table>
        <tr>
          <th>ID</th>
          <th>Nom</th>
          <th>Prix</th>
          <th>Actions</th>
        </tr>

        <%
          List<Produit> produits = (List<Produit>) request.getAttribute("produits");
          if (produits == null) produits = new ArrayList<>();

          if (!produits.isEmpty()) {
            for (Produit p : produits) {
        %>
        <tr>
          <td><%= p.getIdProduit() %></td>
          <td><%= p.getNomProduit() %></td>
          <td><%= p.getPrix() %></td>
          <td class="actions">
            <form action="editProduit" method="get" style="display:inline;">
              <input type="hidden" name="id" value="<%= p.getIdProduit() %>">
              <button class="btn-small" type="submit">✏️modifier</button>
            </form>
            <form action="deleteProduit" method="post" style="display:inline;" onsubmit="return confirm('Supprimer ce produit ?');">
              <input type="hidden" name="id" value="<%= p.getIdProduit() %>">
              <button class="btn-small" type="submit">🗑️supprimer</button>
            </form>
          </td>
        </tr>
        <%
            }
          } else {
        %>
        <tr><td colspan="4">Aucun produit trouvé.</td></tr>
        <% } %>
      </table>
    </div>
  </div>

  <script>
    function showSection(section) {
      // Tabs
      document.getElementById('add-tab').classList.remove('active');
      document.getElementById('list-tab').classList.remove('active');

      // Sections
      document.getElementById('add-section').style.display = 'none';
      document.getElementById('list-section').style.display = 'none';

      if (section === 'add') {
        document.getElementById('add-tab').classList.add('active');
        document.getElementById('add-section').style.display = 'block';
      } else if (section === 'list') {
        document.getElementById('list-tab').classList.add('active');
        document.getElementById('list-section').style.display = 'block';
      }
    }
  </script>
</body>

</html>
