USE notebank;

SELECT * FROM usuario;
SELECT * FROM nota;
SELECT * FROM etiqueta;

call sp_usuario('LoginUsuario',"chuck",NULL,NULL,NULL,NULL,NULL,"12345678");
DELETE FROM nota WHERE Id_Nota = 1;
DELETE FROM usuario WHERE Nombre_Usuario = "lidy2";
DELETE FROM nota;

call sp_nota("Insert",NULL,"chuck","Esto es una nota");
call sp_nota("EliminarNota",1,"chuck","Esto es una nota");
call sp_nota("SelectNotaById",8,"chuck","Esto es una nota");

call sp_etiqueta("Insert","etiqueta2",1);