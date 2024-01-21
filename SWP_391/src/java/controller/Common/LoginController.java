/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Common;

import DAO.Common.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Common.User;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author ifyou
 */
public class LoginController extends HttpServlet {

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
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO userDAO = new UserDAO();
        User user = userDAO.searchUserByEmail(email);
        // check password
        if (user != null) {
            boolean is_true_password = BCrypt.checkpw(password, user.getPassword());
             // if password is true
            if (is_true_password) {
                request.getSession().setAttribute("user", user);
                // check if account is not active
                if (user.getStatus() == 0 && user.getRole() == 4) {
                    request.setAttribute("inactiveMessage", "User is inactive");
                    // send the message active account to customer
                    request.getRequestDispatcher("view\\customer\\register.jsp").forward(request, response);
                } else {
                    switch (user.getRole()) {
                        case 1:
                            response.sendRedirect("view\\admin\\DashBoard.jsp");
                            break;
                        case 2:
                            response.sendRedirect("view\\sale\\Dashboard.jsp");
                            break;
                        case 3:
                            response.sendRedirect("view\\shipper\\Dashboard.jsp");
                            break;
                        default:
                            response.sendRedirect("view\\customer\\Home.jsp");
                            break;
                    }
                }
            } else {
                // password is false
                request.getSession().setAttribute("user", null);
                request.setAttribute("wrongLoginInfo", "email or password is incorrect!");
                request.setAttribute("email", email);
                request.setAttribute("password", password);
                request.getRequestDispatcher("view\\customer\\login.jsp").forward(request, response);
            }
        } else {
            // email is not exist
            request.getSession().setAttribute("user", null);
            request.setAttribute("wrongLoginInfo", "email or password is incorrect!");
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.getRequestDispatcher("view\\customer\\login.jsp").forward(request, response);
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