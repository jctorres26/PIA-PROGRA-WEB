    function validar(){
    var usuario,contrasenia,expresion;
    usuario=document.getElementById("usuario_login").value;
    contrasenia=document.getElementById("contrasenia_login").value;
    expresion= /^[a-zA-Z0-9\_\-]{4,16}$/;
    
   
    if(usuario ==="" || contrasenia===""){
        //alert("Faltan campos para ingresar");
        return false;
    }
   
   


}
   
