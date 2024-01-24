/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Colors;

import DAO.ColorsDAO.ColorsDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Colors.Colors;

/**
 *
 * @author Admin
 */
public class ColorController extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ColorController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ColorController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        ColorsDAO c = new ColorsDAO();
        ArrayList<Colors> data = c.getAll();
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("1")) {
            request.getRequestDispatcher("view\\color\\AddColors.jsp").forward(request, response);
        }
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("2")) {
            Colors color = c.selectColorByID(request.getParameter("id"));
            request.setAttribute("colors", color);
            request.getRequestDispatcher("view\\color\\UpdateColors.jsp").forward(request, response);
        }
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("3")) {
            c.softDeleteColors(request.getParameter("id"));
        }

        request.setAttribute("Cdata", data);
        request.getRequestDispatcher("view\\color\\ListColors.jsp").forward(request, response);
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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String created_at = request.getParameter("created_at");
        String deleted_at = request.getParameter("deleted_at");
        if (request.getParameter("add") != null) {
            ColorsDAO c = new ColorsDAO();
            c.createNewColors(name, description);
            response.sendRedirect("colors");
            return;
        }
        if (request.getParameter("update") != null) {
            ColorsDAO c = new ColorsDAO();
            c.updateColors(id, name, description);
            response.sendRedirect("colors");
            return;
        }
        if (request.getParameter("delete") != null) {
            ColorsDAO c = new ColorsDAO();
            c.softDeleteColors(id);
            response.sendRedirect("colors");
            return;
        }
        if (request.getParameter("restore") != null) {
            ColorsDAO c = new ColorsDAO();
            c.restoreColors(id);
            response.sendRedirect("colors");
            return;
        }
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
