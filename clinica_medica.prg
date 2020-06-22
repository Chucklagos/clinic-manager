set talk off
set readborder on
set escape on
set date to FRENCH
set century on
clear
define window principal from 0,0 to 29,133;
TITLE "Clinica Perfiferica El Sitio" color rgb(,,,192,192,192);
close float minimize grow zoom font "calibri",12
tp="Clinica Periferica El Sitio"
c=15
c2=40
t1="Menu Principal"
t2="Consulta Medica"
opcion=0
* Interfaz del Menu
activate window principal
for espacio=0 to 3 step 0.01
c=c-0.05
for i=0 to len(tp)
@0,c+(i*espacio) say' '+substr(tp,i,1)+' 'font "algerian",18;
style "B" color rgb(150,100,0)
endfor
endfor
for espacio2=0 to 4 step 0.01
c2=c2-0.05
for i=0 to len(t1)
@2,c2+(i*espacio) say ' '+substr(t1,i,1)+' ' font "algerian",16;
style "B" color rgb(150,100,0)
endfor
endfor
@8,2 say "1.- Registro de Pacientes" font "",12 style "b"
@9,2 say "2.- Registro de almacen de Insumos" font "",12 style "b"
@10,2 say "3.- Planilla de Medicos" font "",12 style "b"
@11,2 say "4.- Planilla de Enfermeras" font "",12 style "b"
@12,2 say "5.- Salir de la Aplicacion" font "",12 style "b"
@15,2 say "Elija la opcion deseada: " font "",12 style "b" get opcion picture "9" 
read
* "Case" para escoger que programa se va realizar
do case
case opcion=1
do registro_de_pacientes
case opcion=2
do registro_de_almacen_de_insumos
case opcion=3
do planilla_de_medicos
case opcion=4
do planilla_de_enfermeras
case opcion=5
messagebox("Por favor cierre la ventana de trabajo")
clear
release all
return
otherwise
messagebox("Opcion Incorrecta REINICIANDO PROGRAMA")
do clinica_medica
read
endcase
*-----------------------------------------------------------------------------------------------
* PROGRAMA NUMERO 1 PARA REALIZAR EL REGISTRO DE LOS PACIENTES
procedure registro_de_pacientes
clear
messagebox("10 Registros Maximo")
*Variables
mes=space(15)
fecha=date()
domicilio=space(17)
observacion=space(23)
nombre=space(13)
apellido=space(13)
nueva_linea=" "
*Variables numericas
store 0 to codigo, edad
*Interfaz
@0,15 say "R e g i s t r o  d e  P a c i e n t e s" font"Algerian",20;
style "b" color rgb(150,100,0) 
@3,2 say "Registro del mes de:"font "impact",12  get mes font"Impact",12
@3,50 say "Fecha de Emision:" font "impact",12
@3,73 get fecha font "impact",12
read
@5,2 say "Cod. Paciente" font"Impact",12
@5,19 say "Nombre"  font"impact",12
@5,33 say "Apellido" font"Impact",12
@5,45 say "Edad" font"impact",12
@5,55 say "Domicilio" font"Impact",12
@5,73 say "Observacion" font"Impact",12
c=1
for c=1 to 95 step 0.03      && Ciclo for para crear el lineado Horizontal
@4,c say "-" style "b"
@17,c say "-" style "b"
@19,c say "-" style "b"
c=c+0.01
endfor
nl=7
for l=1 to 10               && Ciclo for para ingresar los datos del
@nl,2 get codigo            && Registro de los pacientes con un maximo de 8 registros  
@nl,16 get nombre
@nl,30 get apellido
@nl,45 get edad picture "999"
@nl,52 get domicilio
@nl,72 get observacion
read
*Estructura if para verificar si desea ingresar otro registro o no
@18,2 say "Presione ENTER para una nueva linea, cualquier otra tecla para terminar :" get nueva_linea
read
if nueva_linea=" " then
nl=nl+1
else
l=13
endif
endfor
messagebox("Limite maximo de registros alcanzado")
read
do clinica_medica
*----------------------------------------------------------------------------------------------
* PROGRAMA NUMERO 2 REGISTRO DE ALMACEN DE INSUMOS
Procedure registro_de_almacen_de_insumos     && programa para llevar el registro
clear                                        && del almacen de insumos de la clinica
messagebox("10 Registros Maximo")
*Variables
descripcion=space(25)
fecha=date()
mes=space(15)
cantidad=space(11)
proveedor=space(18)
nueva_linea=" "
*Variables numericas
store 0 to codigo, precio
*Interfaz de la planilla
@0,10 say "R e g i s t r o  d e  A l m a c e n  d e  I n s u m o s" font"Algerian",20;
style "b" color rgb(150,100,0) 
@3,2 say "Registro del mes de:"font "impact",12  get mes font"Impact",12
@3,50 say "Fecha de Emision:" font "impact",12
@3,73 get fecha font "impact",12
read
@5,2 say "Cod. Producto" font"Impact",12
@5,24 say "Descripcion"  font"impact",12
@5,48 say "Cantidad" font"impact",12
@5,62 say "Proveedor" font"Impact",12
@5,80 say "Precio Unidad" font"Impact",12
c=1
for c=1 to 95 step 0.03      && Ciclo for para crear el lineado Horizontal
@4,c say "-" style "b"
@17,c say "-" style "b"
@19,c say "-" style "b"
c=c+0.01
endfor
nl=7
for l=1 to 10               && Ciclo for para ingresar los datos del
@nl,3 get codigo            && Registro de los pacientes con un maximo de 8 registros  
@nl,17 get descripcion
@nl,47 get cantidad
@nl,59 get proveedor
@nl,81 get precio picture "999.99"
read
*Estructura if para verificar si desea ingresar otro registro o no
@18,2 say "Presione ENTER para una nueva linea, cualquier otra tecla para terminar :" get nueva_linea
read
if nueva_linea=" " then
nl=nl+1
else
l=13
endif
endfor
messagebox("Limite maximo de registros alcanzado")
read
do clinica_medica

*-----------------------------------------------------------------------------------------------
* PROGRAMA NUMERO 3 PLANILLA DE MEDICOS
procedure planilla_de_medicos
clear
messagebox("10 Registros Maximo")
*Variables
medico=space(18)
mes=space(15)
fecha=date()
nueva_linea=" "
*Variables numericas
store 0 to codigo, sueldo, ihss, fosovi, total_deducciones, otras_deducciones, sueldo_neto, a_sueldo_neto
*Interfaz
@0,15 say "P l a n i l l a  d e  M e d i c o s" font"Algerian",20;
style "b" color rgb(150,100,0) 
@3,2 say "Registro del mes de:"font "impact",12  get mes font"Impact",12
@3,50 say "Fecha de Emision:" font "impact",12
@3,73 get fecha font "impact",12
read
@5,2 say "Codigo" font"impact",12
@5,21 say "Medico" font"impact",12
@5,36 say "Sueldo" font"impact",12
@5,44 say "IHSS" font"impact",12
@5,52 say "Otras deducciones" font"impact",12
@5,70 say "Total dedduciones" font"impact",12
@5,86 say "Sueldo neto" font"impact",12
c=1
for c=1 to 97 step 0.03
@4,c say "-" style "b"
@19,c say "-" style "b"
@21,c say "-" style "b"
c=c+0.01
endfor
nl=7
for l=7 to 16
@nl,2 get codigo
@nl,16 get medico
@nl,36 get sueldo picture "99999"
read
if sueldo<=6120 then
IHSS=214.20
else
IHSS=sueldo*0.035
endif
@nl,43 say IHSS picture "9999.99"
@nl,54 get otras_deducciones picture "99999.99"
read
total_deducciones=IHSS+otras_deducciones
sueldo_neto=sueldo-total_deducciones
@nl,72 say total_deducciones picture "999999.99"
@nl,86 say sueldo_neto picture "99999999.99"
a_sueldo_neto=a_sueldo_neto+sueldo_neto
*Estructura if para verificar si desea ingresar otro registro o no
@20,2 say "Presione ENTER para una nueva linea, cualquier otra tecla para terminar :" get nueva_linea
read
if nueva_linea=" " then
nl=nl+1
else
l=18
endif
endfor
@18,50 say "Total de Sueldos Netos: " Font"impact",12
@18,86 say a_sueldo_neto picture "9999999999.99"
messagebox("Limite maximo de registros alcanzado")
do clinica_medica

*----------------------------------------------------------------------------------------------
*PROGRAMA NUMERO 4 PLANILLA DE ENFERMERAS

procedure planilla_de_enfermeras
clear
messagebox("10 Registros Maximo")
*Variables
medico=space(18)
mes=space(15)
fecha=date()
nueva_linea=" "
*Variables numericas
store 0 to codigo, sueldo, ihss, fosovi, total_deducciones, otras_deducciones, sueldo_neto, a_sueldo_neto
*Interfaz
@0,15 say "P l a n i l l a  d e  E n f e r m e r a s" font"Algerian",20;
style "b" color rgb(150,100,0) 
@3,2 say "Registro del mes de:"font "impact",12  get mes font"Impact",12
@3,50 say "Fecha de Emision:" font "impact",12
@3,73 get fecha font "impact",12
read
@5,2 say "Codigo" font"impact",12
@5,21 say "Enfermera" font"impact",12
@5,36 say "Sueldo" font"impact",12
@5,44 say "IHSS" font"impact",12
@5,52 say "Otras deducciones" font"impact",12
@5,70 say "Total dedduciones" font"impact",12
@5,86 say "Sueldo neto" font"impact",12
c=1
for c=1 to 97 step 0.03
@4,c say "-" style "b"
@19,c say "-" style "b"
@21,c say "-" style "b"
c=c+0.01
endfor
nl=7
for l=7 to 16
@nl,2 get codigo
@nl,16 get medico
@nl,36 get sueldo picture "99999"
read
if sueldo<=6120 then
IHSS=214.20
else
IHSS=sueldo*0.035
endif
@nl,43 say IHSS picture "9999.99"
@nl,54 get otras_deducciones picture "99999.99"
read
total_deducciones=IHSS+otras_deducciones
sueldo_neto=sueldo-total_deducciones
@nl,72 say total_deducciones picture "999999.99"
@nl,86 say sueldo_neto picture "99999999.99"
a_sueldo_neto=a_sueldo_neto+sueldo_neto
*Estructura if para verificar si desea ingresar otro registro o no
@20,2 say "Presione ENTER para una nueva linea, cualquier otra tecla para terminar :" get nueva_linea
read
if nueva_linea=" " then
nl=nl+1
else
l=18
endif
endfor
@18,50 say "Total de Sueldos Netos: " Font"impact",12
@18,86 say a_sueldo_neto picture "9999999999.99"
messagebox("Limite maximo de registros alcanzado")
read
do clinica_medica



