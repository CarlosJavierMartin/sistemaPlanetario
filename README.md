# sistemaPlanetario

Autor: Carlos Javier Martín Perdomo

Descripción: Simulación de rotación y translación de diferentes cuerpos planetarios alrededor de una estrella. Cada planeta tiene su propia orbita y rota sobre si mismo. Adicionalmente se han añadido controles de zoom usando las flechas arriba y abajo para acercarse al sistema o alejarse respectivamente.

![error](https://github.com/CarlosJavierMartin/sistemaPlanetario/blob/master/sp.png?raw=true)

Decisiones de código:
  - Se creo una clase llamada Planet que representa un planeta. Contiene todos los datos y parametros necesarios para el planeta y para una posible luna.
  - Se ha decidido rotar la vista para mostrar una perspectiva angulada del sistema. De esta forma se obtiene una vision que elimina la rectitud de las orbitas (Aunque estas siguen siendo rectas alrededor de la estrella).

Resultado:
![error](https://github.com/CarlosJavierMartin/sistemaPlanetario/blob/master/sp.gif?raw=true)

Acciones realizadas:
  -Se realiza un zoom in y un zoom out para verificar que los controles funcionan.
  -Se deja la simulación un tiempo para verla en funcionamiento.
  
Referencias:
  - Recursos de programación:
    - https://processing.org/reference/
