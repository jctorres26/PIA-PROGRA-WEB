/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mycompany.proyecto_neatbeans.controllers;
import com.mycompany.proyecto_neatbeans.DAO.NotaDAO;
import com.mycompany.proyecto_neatbeans.models.Nota;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ALEXANDRA
 */
@WebServlet(name="GetNotasBusquedaS", urlPatterns={"/GetNotasBusquedaS"})
public class GetNotasBusquedaS extends HttpServlet {
  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

   try {
            HashMap resultado = new HashMap();
            Nota nota = new Nota();
            String indice  = request.getParameter("indice");
            String cantidad  = request.getParameter("cantidad");
            List lista =  NotaDAO.listarSEARCH( Integer.parseInt(indice) , Integer.parseInt(cantidad),(String) request.getSession().getAttribute("Username"),(String) request.getSession().getAttribute("busquedaSimple"));
            resultado.put("notas", lista);
            String json = new Gson().toJson(resultado);
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();
        } catch (SQLException ex) {
            Logger.getLogger(GetNotasBusquedaS.class.getName()).log(Level.SEVERE, null, ex);
        }

    }


}
