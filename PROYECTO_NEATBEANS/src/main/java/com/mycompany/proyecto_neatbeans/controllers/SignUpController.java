/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto_neatbeans.controllers;

import com.mycompany.proyecto_neatbeans.DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mycompany.proyecto_neatbeans.models.User;
import com.mycompany.proyecto_neatbeans.utils.FileUtils;
import java.io.File;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author jctor
 */
@WebServlet(name = "SignUpController", urlPatterns = {"/SignUpController"})
@MultipartConfig(maxFileSize = -1, maxRequestSize = -1)


public class SignUpController extends HttpServlet {



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
        
        try {
            String nombre = request.getParameter("Nombre");
            String apellido = request.getParameter("Apellido");
            String correo = request.getParameter("Correo");
            String usuario = request.getParameter("Usuario");
            String contra = request.getParameter("Contrasenia");
            String fechaNac = request.getParameter("fechadenacimiento");
            
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
            
            User user =  new User(usuario, nombre, apellido, fechaNac, correo,  FileUtils.RUTE_USER_IMAGE + "/" + nameImage, contra);
            
            if(UserDAO.insertUser(user)==1){
                response.sendRedirect("index.jsp");
            }
            else{
                
            } } catch (SQLException ex) {
            Logger.getLogger(SignUpController.class.getName()).log(Level.SEVERE, null, ex);
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
