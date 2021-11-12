/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto_neatbeans.DAO;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.mycompany.proyecto_neatbeans.models.User;
import com.mycompany.proyecto_neatbeans.utils.DbConnection;
import java.sql.CallableStatement;

/**
 *
 * @author jctor
 */
public class UserDAO {
    
    public static int insertUser(User user) {
    try{
        Connection con = DbConnection.getConnection();
        String qry = "CALL sp_usuario('Insert',?,?,?,?,?,?,?);";
        CallableStatement statement =  con.prepareCall(qry);
        
        statement.setString(1, user.getUsername());
        statement.setString(2, user.getNombre());
        statement.setString(3, user.getApellido());
        statement.setString(4, user.getFechaNac());
        statement.setString(5, user.getCorreo());
        statement.setString(6, user.getImagenPerfil());
        statement.setString(7, user.getPassword());
        
        return statement.executeUpdate();
        
        
        
    }
     catch(SQLException e){
        System.out.println(e.getMessage());
        }
    
    return 0;
    }
    
    
    public static User logInUser(User user){
        try{
        Connection con = DbConnection.getConnection();
        String sql = "call sp_usuario('LoginUsuario',?,NULL,NULL,NULL,NULL,NULL,?);";
        CallableStatement statement = con.prepareCall(sql);
        
        statement.setString(1, user.getUsername());
        statement.setString(2, user.getPassword());
        
        ResultSet resultSet = statement.executeQuery();
        
        while(resultSet.next()){
        String username = resultSet.getString("Nombre_Usuario");
        String nombre = resultSet.getString("Nombre");
         String apellido = resultSet.getString("Apellido");
          String fechaNac = resultSet.getString("Fecha_Nacimiento");
           String correo = resultSet.getString("Correo");
            String imgPerfil = resultSet.getString("Imagen_Perfil");

            String contra = resultSet.getString("Contra");
            return new User(username, nombre, apellido, fechaNac, correo, imgPerfil,contra);
        
        }
        
       
        
        }catch(SQLException e){
        System.out.println(e.getMessage());
        }
        
        return null;
    
    }



public static int updateUsuario(User user) throws SQLException {
                
               Connection con = null;
    try{
         con = DbConnection.getConnection();
        String qry = "CALL sp_usuario('UpdateUsuario',?,?,?,?,?,?,?);";
        CallableStatement statement =  con.prepareCall(qry);
        
        statement.setString(1, user.getUsername());
        statement.setString(2, user.getNombre());
        statement.setString(3, user.getApellido());
        statement.setString(4, user.getFechaNac());
        statement.setString(5, user.getCorreo());
        statement.setString(6, user.getImagenPerfil());
        statement.setString(7, user.getPassword());

       return statement.executeUpdate();
       
        
        
    }
     catch(SQLException e){
        System.out.println(e.getMessage());
        }
    finally{
    con.close();
    
    }
    return 0;
    }
}
