/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.sale;

import DAO.GroupsDAO.ColorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.product.Color;

/**
 *
 * @author Admin
 */
public class UpdateColorController extends HttpServlet {

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
        
        ColorDAO colorDAO = new ColorDAO();
        List<Color> colorList = colorDAO.selectAllCategory();

        // Chuyển danh sách màu vào request attribute
        request.setAttribute("colorList", colorList);

        // Forward đến trang JSP để hiển thị danh sách màu
        request.getRequestDispatcher("/WEB-INF/views/colorList.jsp").forward(request, response);
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
    response.setContentType("text/html;charset=UTF-8");
    
    // Lấy thông tin màu từ form
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String description = request.getParameter("description");

    // Tạo đối tượng Color
    Color updatedColor = new Color();
    updatedColor.setId(id);
    updatedColor.setName(name);
    updatedColor.setDescription(description);

    // Cập nhật thông tin màu trong database
    ColorDAO colorDAO = new ColorDAO();
    boolean success = colorDAO.updateColor(updatedColor);

    if (success) {
        // Nếu thành công, chuyển hướng đến trang danh sách màu
        response.sendRedirect(request.getContextPath() + "/LoadColorController");
    } else {
        // Nếu thất bại, hiển thị thông báo lỗi
        request.setAttribute("errorMessage", "Failed to update color.");
        request.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
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
