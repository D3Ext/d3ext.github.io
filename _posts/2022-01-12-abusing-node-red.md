---
layout: post
categories: [Abusing CMSs]
---

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/index.png">

## Como conseguir RCE en un Node-Red

Hoy vamos a ver la forma mas sencilla de explotar un Node Red, ya que he visto que se suele explicar de forma compleja.

- Este post es la primera parte de la seccion **Abusing CMS** en la cual explicare como obtener RCE en la mayoria de CMSs una vez accedido como admin

¿Que es Node Red? Pues es un gestor de contenido de codigo abierto que permite crear funciones sin saber programar mediante unos nodos que conectas para crear lo que quieras.
Para esta ocasion voy a explotar el Node Red de la maquina ***Reddish*** de HackTheBox. 

Lo primero, es tener acceso al panel principal para conectar nodos, por lo que tienes que haber iniciado sesion o conseguir burlar el panel de inicio de sesion o alguna otra cosa.

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/panel.png">

Despues hay que buscar en el apartado **"input"** el nodo **"tcp"**, luego busca **"exec"** y tambien en **"output"** otro nodo de **"tcp"** de forma que si los conectamos en linea quedaria asi:

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/line.png">

Luego en el nodo **"tcp"** de la izquierda, cambias el tipo a "connect to" pon tu ip de atacante, y el puerto para recibir la conexión.
Y en el nodo **"tcp"** de la derecha cambias el tipo a "reply to TCP"
Asegurate de estar en escucha con **Netcat** por el puerto que quieras, yo normalmente elijo el 443, que es una buena practica ya que es el puerto de ***ssl***.
Con todo configurado le das al boton de **"deploy"** arriba a la derecha para todo funcione.

Y si todo esta bien deberias recibir una shell en la maquina que corre el Node Red:

<img src="https://raw.githubusercontent.com/D3Ext/d3ext.github.io/main/images/shell.png">

Ya solo faltaria hacer un tratamiento de la **tty** para tener una shell totalmente interactiva que permita hacer Ctrl+C o Ctrl+L y mas cosas.
Que por si no sabes como se hace te dejo un enlace para que veas como es: 

<https://ironhackers.es/tutoriales/como-conseguir-tty-totalmente-interactiva/>
