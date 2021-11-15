/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto_neatbeans.controllers;

import com.google.gson.Gson;
import com.mycompany.proyecto_neatbeans.DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mycompany.proyecto_neatbeans.models.User;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jctor
 */
@WebServlet(name = "LogInController", urlPatterns = {"/LogInController"})
public class LogInController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

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
          HashMap resultado = new HashMap();
            String password;
        try {
          
            PrintWriter write =  response.getWriter();
            
             String username = request.getParameter("usuario_login");
             password = request.getParameter("contrasenia_login");
            User user =  new User(username, password);
            User result = UserDAO.logInUser(user);
            
            
            if(result!= null){
                HttpSession session = request.getSession();
                
                session.setAttribute("Username", result.getUsername());
                session.setAttribute("Nombre", result.getNombre());
                session.setAttribute("Apellido", result.getApellido());
                session.setAttribute("FechaNac", result.getFechaNac());
                session.setAttribute("Correo", result.getCorreo());
                session.setAttribute("ImagenPerfil", result.getImagenPerfil());           
                session.setAttribute("Contra", result.getPassword());
                
                resultado.put("exist",true);
                String json = new Gson().toJson(resultado);
                PrintWriter out = response.getWriter();
                out.print(json);
                out.flush();
                
                
            }else{
               
                resultado.put("exist",false);
                String json = new Gson().toJson(resultado);
                PrintWriter out = response.getWriter();
                out.print(json);
                out.flush();
               
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(LogInController.class.getName()).log(Level.SEVERE, null, ex);
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
