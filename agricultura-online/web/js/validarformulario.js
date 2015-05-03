/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function validarForm(formulario) {
  if(formulario.nombre.value.length==0) { //comprueba que no esté vacío
    formulario.nombre.focus();   
    alert('No has escrito tu nombre'); 
    return false; //devolvemos el foco
  }
  if(formulario.email1.value.length==0) { //comprueba que no esté vacío
    formulario.email1.focus();
    alert('No has escrito tu e-Mail');
    return false;
  }
  if(formulario.email1.value!=formulario.email2.value) {
    formulario.email1.focus();            //comprueba que sean iguales
	alert('Los e-Mails no coinciden');
    return false;
  }
  if(formulario.consulta.value.length==0) {  //comprueba que no esté vacío
    formulario.consulta.focus();
    alert('No has escrito ninguna consulta');
    return false;
  }
  return true;
}


