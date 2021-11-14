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
@WebServlet(name="GetNotasBusquedaST", urlPatterns={"/GetNotasBusquedaST"})
public class GetNotasBusquedaST extends HttpServlet {
   
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException { 
       try {String busqueda = request.getParameter("search");
            HashMap resultado = new HashMap();
            Nota nota = new Nota();
            int cantidad = NotaDAO.cantidadTotalS((String) request.getSession().getAttribute("Username"),(String) request.getSession().getAttribute("busquedaSimple"));
            
            if(cantidad > 0 ){
                resultado.put("respuesta", true);
            }else{
                resultado.put("respuesta", false);
            }
            resultado.put("cantidad", cantidad);
            
            String json = new Gson().toJson(resultado);
            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();
        } catch (SQLException ex) {
            Logger.getLogger(GetNotasBusquedaST.class.getName()).log(Level.SEVERE, null, ex);
        }

    } 

  
}
