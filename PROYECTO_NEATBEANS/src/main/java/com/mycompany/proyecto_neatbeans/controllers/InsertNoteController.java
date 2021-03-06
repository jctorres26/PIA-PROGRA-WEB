/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto_neatbeans.controllers;

import com.mycompany.proyecto_neatbeans.DAO.NotaDAO;
import com.mycompany.proyecto_neatbeans.models.Nota;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jctor
 */
@WebServlet(name = "InsertNoteController", urlPatterns = {"/InsertNoteController"})
public class InsertNoteController extends HttpServlet {

  
 

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String descripcion =  request.getParameter("description");
            String username =  request.getParameter("usernameNota");
            
            
            Nota nota = new Nota(username, descripcion);
            
            if(NotaDAO.insertNota(nota)!=0){
                response.sendRedirect("dashboard.jsp");
            }
            else{
                
            } } catch (SQLException ex) {
            Logger.getLogger(InsertNoteController.class.getName()).log(Level.SEVERE, null, ex);
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
