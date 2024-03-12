/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Common;

import DAO.Common.OrderDAO;
import DAO.Common.OrderDetailDAO;
import DAO.Common.OrderStatusDAO;
import DAO.Common.UserDAO;
import DAO.ProductDAO.ProductDetailDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.ArrayList;
import model.Common.Order;
import model.Common.OrderDetail;
import model.Common.OrderStatus;
import model.Common.User;

/**
 *
 * @author ifyou
 */
public class EditOrderController extends HttpServlet {

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
            out.println("<title>Servlet EditOrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditOrderController at " + request.getContextPath() + "</h1>");
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
        String orderId = request.getParameter("id");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        // Check if user have loged in
        if (user == null) {
            request.setAttribute("loginMessage", "Vui lòng đăng nhập để sử dụng dịch vụ!");
            request.getRequestDispatcher("view\\customer\\login.jsp").forward(request, response);
            return;
        } else if (user.getRole() == 4) {
            response.sendRedirect("404.jsp");
        } else {
            OrderDAO orderDAO = new OrderDAO();
            Order order = orderDAO.searchOrderById(orderId);
            request.setAttribute("order", order);
            UserDAO userDAO = new UserDAO();
            ArrayList<User> shippers = userDAO.sellectallShipper();
            OrderStatusDAO orderStatusDAO = new OrderStatusDAO();
            OrderStatus orderStatus = orderStatusDAO.searchById(order.getOrderStatus());
            ArrayList<OrderStatus> orderStatusForSale = orderStatusDAO.getOrderStatusForSale();
            ArrayList<OrderStatus> orderStatusForShipper = orderStatusDAO.getOrderStatusForShipper();
            request.setAttribute("shippers", shippers);
            request.setAttribute("orderStatusForSale", orderStatusForSale);
            request.setAttribute("orderStatusForShipper", orderStatusForShipper);
            request.setAttribute("orderStatus", orderStatus);
            request.getRequestDispatcher("view\\sale\\UpdateOrder.jsp").forward(request, response);
        }

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
        String orderId = request.getParameter("id");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        // Check if user have loged in
        if (user == null) {
            request.setAttribute("loginMessage", "Vui lòng đăng nhập để sử dụng dịch vụ!");
            request.getRequestDispatcher("view\\customer\\login.jsp").forward(request, response);
            return;
        } else if (user.getRole() == 4) {
            response.sendRedirect("404.jsp");
        } else {
            String id = request.getParameter("id");
            String shiperId = request.getParameter("shipper");
            String status = request.getParameter("status");
            String note = request.getParameter("note");
            String expectedDeliveryDate = request.getParameter("expectedDeliveryDate");
            expectedDeliveryDate += " 00:00:00";
            OrderDAO orderDAO = new OrderDAO();
            ProductDetailDAO pdDAO = new ProductDetailDAO();
            if(status.equals("5") || status.equals("6")){
                Order o = orderDAO.searchOrderById(id);
                OrderDetailDAO odDAO = new OrderDetailDAO();
                ArrayList<OrderDetail> orderDetails = odDAO.selectByOrderId(o.getId());
                for (OrderDetail orderDetail : orderDetails) {
                    pdDAO.addQuantity(orderDetail.getProductDetail().getId(), String.valueOf(orderDetail.getQuantity()));
                }
                orderDAO.editOrder(Integer.parseInt(id), Integer.parseInt(shiperId), Integer.parseInt(status), note, Timestamp.valueOf(expectedDeliveryDate));                
            }else{
                orderDAO.editOrder(Integer.parseInt(id), Integer.parseInt(shiperId), Integer.parseInt(status), note, Timestamp.valueOf(expectedDeliveryDate));
            }
            response.sendRedirect("OrderController");
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
