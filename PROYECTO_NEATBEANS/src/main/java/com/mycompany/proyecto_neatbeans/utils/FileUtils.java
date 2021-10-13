/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.proyecto_neatbeans.utils;

/**
 *
 * @author jctor
 */
public class FileUtils {
    
      public static String RUTE_USER_IMAGE = "assets/imagenes";
    
    public static String GetExtension(String contentType){
    switch(contentType){
        case "image/png":
            return ".png";
          case "image/jpg":
            return ".jpg";
                  case "video/mp4":
            return ".mp4";
        
    }
    
    return ".ext";
    }
    
}
