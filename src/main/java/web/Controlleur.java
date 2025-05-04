package web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.ProduitDaoImpl;
import metier.Produit;
import metier.user;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {
    "/acceuil",
    "/addProduit",
    "/editProduit",
    "/deleteProduit"
})
public class Controlleur extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();
        ProduitDaoImpl dao = new ProduitDaoImpl();

        if (path.equals("/acceuil")) {
            String login = request.getParameter("login");
            String password = request.getParameter("password");

            user user1 = new user(login, password);
            if (user1.verifier()) {
                List<Produit> produits = dao.findAll();
                request.setAttribute("produits", produits);
                request.setAttribute("user", login);
                request.getRequestDispatcher("/view.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/acceuil.html").forward(request, response);
            }
        }

        else if (path.equals("/addProduit")) {
            String nom = request.getParameter("nomProduit");
            double prix = Double.parseDouble(request.getParameter("prix"));

            Produit produit = new Produit();
            produit.setNomProduit(nom);
            produit.setPrix(prix);

            dao.save(produit);

            List<Produit> produits = dao.findAll();
            request.setAttribute("produits", produits);
            request.getRequestDispatcher("/view.jsp").forward(request, response);
        }

        else if (path.equals("/deleteProduit")) {
            long id = Long.parseLong(request.getParameter("id"));
            dao.deleteProduit(id);

            List<Produit> produits = dao.findAll();
            request.setAttribute("produits", produits);
            request.getRequestDispatcher("/view.jsp").forward(request, response);
        }

        else if (path.equals("/editProduit")) {
            long id = Long.parseLong(request.getParameter("id"));
            String nom = request.getParameter("nomProduit");
            double prix = Double.parseDouble(request.getParameter("prix"));

            Produit produit = dao.getProduit(id);
            produit.setNomProduit(nom);
            produit.setPrix(prix);
            dao.updateProduit(produit);

            List<Produit> produits = dao.findAll();
            request.setAttribute("produits", produits);
            request.getRequestDispatcher("/view.jsp").forward(request, response);
        }

        else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath();

        if (path.equals("/editProduit")) {
            long id = Long.parseLong(request.getParameter("id"));
            ProduitDaoImpl dao = new ProduitDaoImpl();
            Produit produit = dao.getProduit(id);
            request.setAttribute("produit", produit);
            request.getRequestDispatcher("/editProduit.jsp").forward(request, response);
        }

        else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }
}
