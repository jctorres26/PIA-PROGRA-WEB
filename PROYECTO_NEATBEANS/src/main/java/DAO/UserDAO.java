/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import models.User;
import utils.DbConnection;

/**
 *
 * @author jctor
 */
public class UserDAO {
    
    public static void insertUser() throws SQLException{
    
        Connection con = DbConnection.getConnection();
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
        return new User(username);
        }
        
       
        
        }catch(SQLException e){
        System.out.println(e.getMessage());
        }
        
        return null;
    
    }
}
