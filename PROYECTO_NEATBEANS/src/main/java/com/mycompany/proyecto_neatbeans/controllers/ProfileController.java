/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mycompany.proyecto_neatbeans.controllers;
import com.mycompany.proyecto_neatbeans.DAO.UserDAO;
import com.mycompany.proyecto_neatbeans.models.User;
import com.mycompany.proyecto_neatbeans.utils.FileUtils;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author ALEXANDRA
 */
@WebServlet(name="ProfileController", urlPatterns={"/ProfileController"})
@MultipartConfig(maxFileSize = -1, maxRequestSize = -1)

public class ProfileController extends HttpServlet {
   
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
            out.println("<title>Servlet ProfileController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileController at " + request.getContextPath () + "</h1>");
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
        processRequest(request, response);
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
        
   try {
       int result;
            String username = request.getParameter("usuario");
            String nombre = request.getParameter("Nombre");
            String apellido = request.getParameter("Apellido");
            String fechaNac = request.getParameter("fecha");
            String correo = request.getParameter("correo");
            String password = request.getParameter("contra");
            String img = request.getParameter("fotografia");
           
             String path = request.getServletContext().getRealPath("");   
        File fileSaveDir = new File(path + FileUtils.RUTE_USER_IMAGE);
        
        if(!fileSaveDir.exists()){
            fileSaveDir.mkdir();
        }
        
        Part file = request.getPart("Fotografia");
         String contentType = file.getContentType();
      String nameImage = file.getName() + System.currentTimeMillis() + FileUtils.GetExtension(contentType);
       String fullPath = path + FileUtils.RUTE_USER_IMAGE + "/" + nameImage;
       file.write(fullPath);
       
       if(nameImage.contains(".ext")){
           HttpSession session = request.getSession(true);
         User user =  new User(username, nombre,apellido,fechaNac,correo,session.getAttribute("ImagenPerfil").toString(),password);
            
             result = UserDAO.updateUsuario(user);
             if(result!= 0){
                 
                 session.setAttribute("Username", username);
                
        session.setAttribute("Nombre", nombre);
        session.setAttribute("Apellido", apellido);
        session.setAttribute("FechaNac", fechaNac);
        session.setAttribute("Correo", correo);
        session.setAttribute("Contra", password);
        
        
                response.sendRedirect("perfil.jsp");
            }

   }else{
        User user =  new User(username, nombre,apellido,fechaNac,correo,FileUtils.RUTE_USER_IMAGE + "/" + nameImage  ,password);
            
             result = UserDAO.updateUsuario(user);
             if(result!= 0){
                 HttpSession session = request.getSession(true);
                 session.setAttribute("Username", username);
                
        session.setAttribute("Nombre", nombre);
        session.setAttribute("Apellido", apellido);
        session.setAttribute("FechaNac", fechaNac);
        session.setAttribute("Correo", correo);
        session.setAttribute("Contra", password);
        session.setAttribute("ImagenPerfil", FileUtils.RUTE_USER_IMAGE + "/" + nameImage);
        
                response.sendRedirect("perfil.jsp");
            }
       
       }
            
        } catch (SQLException ex) {
            Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
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
