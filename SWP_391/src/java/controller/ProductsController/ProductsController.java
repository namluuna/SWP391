/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.ProductsController;
import DAO.GroupsDAO.CategoryDAO;
import DAO.ProductDAO.ProductsDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import model.Categories.Category;
import model.Product.Products;

/**
 *
 * @author lucdu
 */
public class ProductsController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductsController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductsController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductsDAO p = new ProductsDAO();
        CategoryDAO g = new CategoryDAO();
        if (request.getParameter("mod") != null && request.getParameter("mod").equals("1")) {
            List<Category> data1 = g.selectAllCategory();
            request.setAttribute("data1", data1);
            request.getRequestDispatcher("view\\Products\\CreateProducts.jsp").forward(request, response);
        }
//        if (request.getParameter("mod") != null && request.getParameter("mod").equals("2")) {
//            Groups group = g.selectGroupsByID(request.getParameter("id"));
//            request.setAttribute("group", group);
//            request.getRequestDispatcher("view\\Groups\\UpdateGroups.jsp").forward(request, response);
//        }
//        if (request.getParameter("mod") != null && request.getParameter("mod").equals("3")) {
//            g.softDeleteGroups(request.getParameter("id"));
//        }
        //------------------------------------------------------------------------------------------------------------------
        ArrayList<Products> data = p.selectAllProducts();
        request.setAttribute("data", data);
        request.getRequestDispatcher("view\\Products\\VeiwProducts.jsp").forward(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String id = request.getParameter("id");
        String code = request.getParameter("code");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String category_id = request.getParameter("category_id");
        String form_id = request.getParameter("form_id");
        String brand_id = request.getParameter("brand_id");
        String material_id = request.getParameter("material_id");
        String group_id = request.getParameter("group_id");
        
        if (request.getParameter("add")!= null) {
            ProductsDAO p = new ProductsDAO();
            p.createNewProduct(code, name, description, price, category_id, form_id, brand_id, material_id, group_id);
            response.sendRedirect("products");
            return;
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
