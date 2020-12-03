# **breadnow** 

Aplicación móvil de agendamiento de pan y pastelería, con entrega delivery y opción de personalizar entrega.
:bread::bread::bread:

![Alt text](https://raw.githubusercontent.com/Jorgearredondoe/breadnow/master/assets/init.png)


## **Commit1 19-11-2020**

Se respalda todos el código programado hasta el momento. Esto incluye:
Archivo | Comentario
--------|------------
main.dart| Pantalla de inicio de la aplicación, esta solo puede llevar a registrarse (Signin.dart)
signin.dart| pantalla de inicio de sesión, no se encuentra enlazado a una base de datos por lo que lso datos no son guardados.
register_complete.dart| Indica que el inicio de sesión fue exitoso.
assets| se incluyen las fotos utilizadas en los archivos anteriores.

## **Commit2 20-11-2020**

Se agregan los siguientes archivos nuevos:

Archivo | Comentario
--------|------------
cate_desc|Placeholder.
cate_destacados.dart|Placeholder.
cate_freedelivery.dart|Placeholder.
cater_cerca.dart|Placeholder.
popu_cafe.dart|Placeholder.
popu_donuts.dart|Inicialmente Placeholder, se inicia el desarrollo de esta página.
popu_marraqueta.dart|Placeholder.
popu_pie.dart|Placeholder.
populares.dart|Placeholder.
scroll_list_example.dart|Archivo de pruebas para las listas de arrastres de flutter.

Se modifican los siguientes archivos:

Archivo | Comentario
--------|------------
home_screen.dart|Se realizan modificaciones de las listas de arrastres e imágenes a utilizar.
main.dart|Modificaciones menores.


## **Commit3 24-11-2020**

Commit que incluye un bug en el archivo popu_donuts.dart

Se modifican los siguientes archivos:

Archivo | Comentario
--------|------------
home_screen.dart|Se agregan imágenes a "Destacados".
popu_donuts.dart|Se agregan nuevas imágenes y elementos a la lista. Se genera un bug que genera un crush en la app.
populares.dart|Modificaciones menores.


## **Commit3.1 24-11-2020**

Soluciona el bug del archivo popu_donuts.dart

Se modifican los siguientes archivos:

Archivo | Comentario
--------|------------
popu_donuts.dart|Se soluciona el bug de la versión anterior.

**Todos los commits mencionados fueron comentados el día 27-11-2020 (día en que se indicó que es necesario tener esta información), lo que explicaría el poco detalle de cada uno de estos. De ahora en adelante se continuara con el numero de versión correspondiente** :wink:


## **Commit: 3.1.1 02-12-2020**

En esta versión se comienza el desarrollo del carrito de compras. Esto se desarrolla inicialmente en el archivo products.dart, cart.dart, home_screen.dart y popu_donuts.dart.
Se modifican los siguientes archivos:

Archivo | Comentario
--------|------------
home_screen.dart|Se agregan los botones en las imagenes de "nuevos esta semana". Se pobla la lista de productos a utilizar por el carrito, mediante la función _populateDonuts().
popu_donuts.dart|Se agregan más productos a a la lista. Tiene un bug visual relacionado con el tamaño de las imagenes, es posible que esto se solucione usando icons, en lugar de image.assets.
products.dart|Se crea la clase Product, la cual tiene múltiples atributos las cuales serán utilizadas para el carrito de compras y la creación de lista de productos.
cart.dart|Página de carrito donde se puede visualizar todos los productos que se han agregado al carrito. Falta agregar un boton de confirmar compra y cambiar el estilo y color de la appbar a la appbar oficial de BREADNOW.

![Alt text](https://raw.githubusercontent.com/Jorgearredondoe/breadnow/master/assets/bug_popudonut.png)

![Alt text](https://raw.githubusercontent.com/Jorgearredondoe/breadnow/master/assets/cart.png)

**Aún faltan detalles para tener lista la primera iteración de la app funcional, por lo que se espera que esta iteración se encuentre completa para la versión 3.2.1. Una vez completa esta iteración, se procederá a conectar la app con la base de datos.**

## **Commit: 3.1.2 03-12-2020**

Se soluciona el bug visual (overflow) de popu_donuts.dart. Esto se realiza determinando el tamaño de las iamgenes y de lso textos dentro de cada una de las tarjetas.
Adicional, en cart.dart se cambia el appbar al appbar oficial de BREADNOW.

Archivo | Comentario
--------|------------
popu_donuts.dart|Se soluciona el bug de overflow en cada tarjeta. Esto se soluciona determina el tamaño de las imagenes y textos. Existe todavia un bug de overflow al intentar agrandar la lista, probablemente se encuentra relacionada con el scroll de la página, y widget que no se encuentran limitados.
cart.dart|Se cambia el appbar al appbar oficial de BREADNOW

![Alt text](https://raw.githubusercontent.com/Jorgearredondoe/breadnow/master/assets/bug_popudonut_fix1.1.jpg)

![Alt text](https://raw.githubusercontent.com/Jorgearredondoe/breadnow/master/assets/cart_2.jpg)