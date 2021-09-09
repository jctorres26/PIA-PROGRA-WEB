    function validar(){
    var usuario,contraseña,expresion;
    usuario=document.getElementById("usuario_login").value;
    contraseña=document.getElementById("contraseña_login").value;
    expresion= /^[a-zA-Z0-9\_\-]{4,16}$/;
    
   
    if(usuario ==="" || contraseña===""){
        //alert("Faltan campos para ingresar");
        return false;
    }
    else if(usuario.length>21 || usuario.length<4){
         //alert("El usuario debe de tener minimo 4 caracteres y maximo 20");
        return false;
    }
    else if(contraseña.length !== 8){
         //alert("La contraseña debe de tener 8 caracteres");
        return false;
    }
    else if(!expresion.test(usuario)){
        //alert("Valores no validos");
        return false;
    }
    else if(!expresion.test(contraseña)){
        //alert("Valores no validos");
        return false;
    }
   
}