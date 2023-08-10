# ACTIVIDAD 3

## PARTE 1

```markdown
## Entrada
sudo useradd usuario1 && sudo useradd usuario2 && sudo useradd usuario3 && sudo passwd usuario1 && sudo passwd usuario2 && sudo passwd usuario3 && id usuario1 && sudo userdel usuario3 && sudo userdel -r usuario3

## Salida
[sudo] contraseña para dmaza: 
Nueva contraseña: 
CONTRASEÑA INCORRECTA: La contraseña tiene menos de 8 caracteres
Vuelva a escribir la nueva contraseña: 
Las contraseñas no coinciden.
Nueva contraseña: 
Vuelva a escribir la nueva contraseña: 
passwd: contraseña actualizada correctamente
Nueva contraseña: 
Vuelva a escribir la nueva contraseña: 
passwd: contraseña actualizada correctamente
Nueva contraseña: 
Vuelva a escribir la nueva contraseña: 
passwd: contraseña actualizada correctamente
uid=1001(usuario1) gid=1001(usuario1) grupos=1001(usuario1)
userdel: el usuario «usuario3» no existe

```
## PARTE 2

```markdown
## Entrada
sudo groupadd grupo1 && sudo groupadd grupo2 && sudo usermod -aG grupo1 usuario1 && sudo usermod -aG grupo2 usuario2 && groups usuario1 && groups usuario2 && sudo groupdel grupo2
## Salida
usuario1 : usuario1 grupo1
usuario2 : usuario2 grupo2

```
## PARTE 3

```markdown
## Entrada
# 1. Creación de Archivos y Directorios
sudo groupadd grupo1 ; \
sudo useradd -m -G grupo1 usuario1 ; \
sudo useradd -m usuario2 ; \
sudo mkdir /home/usuario1 ; \
sudo mkdir /home/usuario1/directorio1 ; \
sudo chown usuario1:grupo1 /home/usuario1/directorio1 ; \
sudo touch /home/usuario1/archivo1.txt ; \
sudo touch /home/usuario1/directorio1/archivo2.txt ; \
sudo chown usuario1:grupo1 /home/usuario1/archivo1.txt /home/usuario1/directorio1/archivo2.txt ; \

# Agregar contenido al archivo1.txt
echo "Hola sopes 1 :D" | sudo tee /home/usuario1/archivo1.txt > /dev/null && \

# 2. Verificar Permisos
ls -l /home/usuario1/archivo1.txt && \
ls -ld /home/usuario1/directorio1 && \

# 3. Modificar Permisos usando chmod con Modo Numérico
sudo chmod 640 /home/usuario1/archivo1.txt && \

# 4. Modificar Permisos usando chmod con Modo Simbólico
chmod +x /home/usuario1/directorio1/archivo2.txt && \

# 5. Cambiar el Grupo Propietario
chown :grupo1 /home/usuario1/directorio1/archivo2.txt && \

# 6. Configurar Permisos de Directorio
chmod 750 /home/usuario1/directorio1 && \

# 7. Comprobación de Acceso
su usuario2 -c "cat /home/usuario1/archivo1.txt" || \
su usuario2 -c "cat /home/usuario1/directorio1/archivo2.txt" || \

# 8. Verificación Final
ls -l /home/usuario1/archivo1.txt && \
ls -ld /home/usuario1/directorio1

## Salida
dmaza@dmaza-HP-Laptop-14-dq1xxx:~/Descargas/actividad3$ sudo ./Parte3.shh 
groupadd: el grupo «grupo1» ya existe
useradd: el usuario «usuario1» ya existe
useradd: el usuario «usuario2» ya existe
mkdir: no se puede crear el directorio «/home/usuario1»: El archivo ya existe
mkdir: no se puede crear el directorio «/home/usuario1/directorio1»: El archivo ya existe
-rw-r----- 1 usuario1 grupo1 16 ago  9 19:58 /home/usuario1/archivo1.txt
drwxr-x--- 2 usuario1 grupo1 4096 ago  9 19:52 /home/usuario1/directorio1
cat: /home/usuario1/archivo1.txt: Permiso denegado
cat: /home/usuario1/directorio1/archivo2.txt: Permiso denegado
-rw-r----- 1 usuario1 grupo1 16 ago  9 19:58 /home/usuario1/archivo1.txt
drwxr-x--- 2 usuario1 grupo1 4096 ago  9 19:52 /home/usuario1/directorio1
```

## CONCLUSIONES (OPCIONAL) 
¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo?
R// Es importante porque ayuda a mantener un grado más de seguridad en datos sensibles y poder manejar una mejor administración de nuestra información.

¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux?

R// Pues adicional a los vistos chgrp que es un comando que se usaba en manejo de implementación de archivos que no cambia permisos como tal pero cambia de grupo propietario, que técnicamente es como darle permisos a un grupo para ser dueño.
