/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto_neatbeans.DAO;

import com.mycompany.proyecto_neatbeans.models.Nota;
import com.mycompany.proyecto_neatbeans.models.User;
import com.mycompany.proyecto_neatbeans.utils.DbConnection;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jctor
 */
public class NotaDAO {
    
    
       public static int insertNota(Nota nota) {
    try{
        Connection con = DbConnection.getConnection();
        String qry = "CALL sp_nota('Insert',NULL,?,?);";
        CallableStatement statement =  con.prepareCall(qry);
        
        statement.setString(1, nota.getUserNota());
        statement.setString(2, nota.getDescripcion());
       
        
        return statement.executeUpdate();
        
        
        
    }
     catch(SQLException e){
        System.out.println(e.getMessage());
        }
    
    return 0;
    }
       
       
       public static List<Nota> getNotasByUsuario (String username){
           List<Nota> notas = new ArrayList<>();
           Connection con = null;
        try{
            
         
         con = DbConnection.getConnection();
        String qry = "CALL sp_nota('SelectNotasByUsuario',NULL,?,NULL);";
        CallableStatement statement =  con.prepareCall(qry);
       statement.setString(1,username);
       ResultSet result = statement.executeQuery();
        while(result.next()){
        int id = result.getInt("Id_Nota");
        String usernameNota =  result.getString("Nombre_Usuario");
        String descripcion = result.getString("Descripcion");
        notas.add(new Nota(id, usernameNota, descripcion));
        
        }
            
    }
     catch(SQLException e){
        System.out.println(e.getMessage());
        }
       return notas;
       }
       
       public static Nota getNotaById (int idNota){
           
           Connection con = null;
        try{
            
         
         con = DbConnection.getConnection();
        String qry = "CALL sp_nota('SelectNotaById',?,NULL,NULL);";
        CallableStatement statement =  con.prepareCall(qry);
       statement.setInt(1,idNota);
       ResultSet result = statement.executeQuery();
        while(result.next()){
        int id = result.getInt("Id_Nota");
        String usernameNota =  result.getString("Nombre_Usuario");
        String descripcion = result.getString("Descripcion");
        return new Nota(id, usernameNota, descripcion);
        
        }
            
    }
     catch(SQLException e){
        System.out.println(e.getMessage());
        }
       return null;
       }
       
            public static int updateNota(Nota nota) {
    try{
        Connection con = DbConnection.getConnection();
        String qry = "CALL sp_nota('UpdateNota',?,NULL,?);";
        CallableStatement statement =  con.prepareCall(qry);
        
        statement.setInt(1, nota.getIdNota());
        statement.setString(2, nota.getDescripcion());
       
        
        return statement.executeUpdate();
        
        
        
    }
     catch(SQLException e){
        System.out.println(e.getMessage());
        }
    
    return 0;
    }
       
       
            public static int deleteNota(Nota nota) {
    try{
        Connection con = DbConnection.getConnection();
        String qry = "CALL sp_nota('EliminarNota',?,NULL,NULL);";
        CallableStatement statement =  con.prepareCall(qry);
        
        statement.setInt(1, nota.getIdNota());
     
       
        
        return statement.executeUpdate();
        
        
        
    }
     catch(SQLException e){
        System.out.println(e.getMessage());
        }
    
    return 0;
    }
       
       
    
}
