/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package src;

import Connection.NewHibernateUtil;
import DB.LoginSession;
import DB.UserLogin;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Lakmal
 */
public class Ers extends HttpServlet {

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
             Session s=NewHibernateUtil.getSessionFactory().openSession();
            Transaction tr=s.beginTransaction();
            
            String un=request.getParameter("uname");
            String pw=request.getParameter("pass");
            System.out.println(un+" "+pw);
            Criteria c=s.createCriteria(UserLogin.class);
            c.add(Restrictions.eq("username", un));
            c.add(Restrictions.eq("password", pw));
            
            UserLogin ul=(UserLogin) c.uniqueResult();
            
            if (ul== null) {
                response.sendRedirect("index.jsp?masg=invalid User");
            }else{
                LoginSession ls=new LoginSession();
                ls.setIpAddress(request.getRemoteHost());
                ls.setInTime(new Date());
                ls.setOutTime(new Date());
                ls.setUserLogin(ul);
                s.save(ls);
                tr.commit();
                s.flush();
                System.out.println(ls.getId());
                request.getSession().setAttribute("a", ls.getId());
                response.sendRedirect("profile.jsp");
            }
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
