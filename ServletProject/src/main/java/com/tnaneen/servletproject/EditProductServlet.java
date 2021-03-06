/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tnaneen.servletproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rocke
 */
@WebServlet(name = "EditProductServlet", urlPatterns = {"/editProductServlet"})
public class EditProductServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession mySession = request.getSession();
            DatabaseHandler db = new DatabaseHandler();
            int id = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("prodName");
            String productDesc = request.getParameter("prodDesc");
            int price = Integer.parseInt(request.getParameter("prodPrice"));
            String productImage = request.getParameter("prodImage");
            int available = Integer.parseInt(request.getParameter("prodQuantity"));
            Product editedProduct = db.getProduct(id);
            String category = editedProduct.getCategory();
            ArrayList<Product> products = (ArrayList<Product>) mySession.getAttribute(category + "List");
            Product newProduct = new Product(id, productName, price, available, category, productDesc, productImage);

            /////////////////   b. looooop to get target product
            Product selectedProduct = null;
            for (int i = 0; i < products.size(); i++) {
                Product current = products.get(i);
                if (current.getId() == id) {
                    selectedProduct = current;
                    break;
                }
            }

            products.remove(selectedProduct);

            db.updateProduct(newProduct);
            products.add(newProduct);
            mySession.setAttribute(category + "List", products);
            response.sendRedirect("addProduct.jsp");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
