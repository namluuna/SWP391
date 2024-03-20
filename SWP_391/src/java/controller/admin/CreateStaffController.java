/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import DAO.Common.UserContractDAO;
import DAO.Common.UserDAO;
import Service.SendMailService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Common.User;
import model.Common.UserContract;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author Admin
 */
public class CreateStaffController extends HttpServlet {

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
            out.println("<title>Servlet CreateStaffController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateStaffController at " + request.getContextPath() + "</h1>");
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
        // processRequest(request, response);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            request.setAttribute("loginMessage", "Vui lòng đăng nhập để sử dụng dịch vụ!");
            request.getRequestDispatcher("view\\customer\\login.jsp").forward(request, response);
            return;
        } else if (user.getRole() != 1) {
            response.sendRedirect("404.jsp");
        } else {
            String sName = request.getParameter("name");
            String sEmail = request.getParameter("email");
            String sPassword = request.getParameter("password");
            String sPhone = request.getParameter("phone");
            String sRole = request.getParameter("role");
            String sSalary = request.getParameter("salary");
            String sSlot = request.getParameter("slot");
            String sGender = request.getParameter("gender");
            UserDAO userDAO = new UserDAO();
            User checkUser = userDAO.searchUserByEmail(sEmail);
            // if an user have used entered email
            if (checkUser != null) {
                String errorEmailMessage = "Địa chỉ email này đã tồn tại!";
                request.setAttribute("name", sName);
                request.setAttribute("email", sEmail);
                request.setAttribute("password", sPassword);
                request.setAttribute("phone", sPhone);
                request.setAttribute("role", sRole);
                request.setAttribute("salary", sSalary);
                request.setAttribute("slot", sSlot);
                request.setAttribute("gender", sGender);
                request.setAttribute("errorEmailMessage", errorEmailMessage);
                request.getRequestDispatcher("view\\admin\\CreateStaff.jsp").forward(request, response);
            } else {
                String encodedPassword = BCrypt.hashpw(sPassword, BCrypt.gensalt(10));
                UserDAO udao = new UserDAO();
                UserContractDAO uconDAO = new UserContractDAO();
                User newUser = new User(sName, sEmail, encodedPassword, sPhone, 0, 2, 1);
                udao.addNewUser(newUser);
                User newUserContract = userDAO.searchUserByEmail(sEmail);
                if (sGender.equals("1")) {
                    if (sSlot.equals("1")) {
                        UserContract uContract = new UserContract(newUserContract.getId(), 1, sSalary, 1);
                        uconDAO.addNewUserContract(uContract);
                    } else if (sSlot.equals("2")) {
                        UserContract uContract = new UserContract(newUserContract.getId(), 2, sSalary, 1);
                        uconDAO.addNewUserContract(uContract);
                    } else if (sSlot.equals("3")) {
                        UserContract uContract = new UserContract(newUserContract.getId(), 3, sSalary, 1);
                        uconDAO.addNewUserContract(uContract);
                    }
                } else if (sGender.equals("2")) {
                    if (sSlot.equals("1")) {
                        UserContract uContract = new UserContract(newUserContract.getId(), 1, sSalary, 2);
                        uconDAO.addNewUserContract(uContract);
                    } else if (sSlot.equals("2")) {
                        UserContract uContract = new UserContract(newUserContract.getId(), 2, sSalary, 2);
                        uconDAO.addNewUserContract(uContract);
                    } else if (sSlot.equals("3")) {
                        UserContract uContract = new UserContract(newUserContract.getId(), 3, sSalary, 2);
                        uconDAO.addNewUserContract(uContract);
                    }
                }

                SendMailService sm = new SendMailService();
                sm.sendNewAccount(newUser.getEmail(), sPassword);
                response.sendRedirect("staff");
            }
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
