# Habit@weave
Habit@weave is a web application for the control and monitoring “smart home” and wearable devices.
The power consumption graphs and the capability to schedule actions can help the user to make the right decisions for efficient energy saving at home, while the calorie consumption and sleep quality charts may contribute to adoption of habits that improve heath. The user can use the application from a PC, as well as from any other portable device with access to the Internet. It is an initial effort towards a functional Ambient Assisted Living system.

It's a Maven project created in NetBeans. Backend is written in Java using javax.servlet API, frontend is based on Bootstrap and implemented with JSP views. The project integrades Shiro and Hibernate frameworks.

== Set the mysql config
You have to set the mysql username, password and database name in
this files:
 * src/hibernate.cfg.xml
 * WebContent/WEB-INF/shiro.ini
