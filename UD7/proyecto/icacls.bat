REM Comprobamos si existen las carpetas, en caso contrario se crean

if NOT EXIST C:\Documentación mkdir C:\Documentación
if NOT EXIST C:\Documentación\Dirección mkdir C:\Documentación\Dirección
if NOT EXIST C:\Documentación\Informatica mkdir C:\Documentación\Informatica


# Departamento de Direccion
#Se crea el grupo Direccion_RW, para pemitir leer y escribir en la carpeta
net localgroup Direccion_RW /add /comment: "Acceso en modo lectura/escritura a Dirección"
#Se añade el usuario usuario_Direcc al grupo Direccion_RW
net localgroup Dirección_RW usuario_Direcc /add
::Se eliminan las herencias
icacls C:\Documentación\Dirección /inheritance:d /T
::Se eliminan los grupos Usuarios y Usuarios autentificados
icacls C:\Documentación\Dirección /remove:g Usuarios
icacls C:\Documentación\Dirección /remove:g "Usuarios autentificados"
::Se añeden los permisos a la carpeta mediante el grupo Dirección_RW
::OI - Object inherit    - This folder and files. (no inheritance to subfolders)
::CI - Container inherit - This folder and subfolders.
::Con la combinación de OI-CI, se aplican los permisos al directorio actual, subdirectorios (CI) y ficheros (OI).
icacls C:\Documentación\Dirección /GRANT Dirección_RW:(OI)(CI)(R,W)


# Departamento de Informática
#Se crea el grupo Informatica_R, para pemitir leer en la carpeta
net localgroup Informatica_R /add /comment: "Acceso en modo lectura/escritura a Informatica"
#Se añede el usuario usuario_Inf al grupo Informatica_RW
net localgroup Informatica_RW usuario_Inf /add
::Se eliminan las herencias
icacls C:\Documentación\Informatica /inheritance:d /T
::Se eliminan los grupos Usuarios y Usuarios autentificados
icacls C:\Documentación\Informatica /remove:g Usuarios
icacls C:\Documentación\Informatica /remove:g "Usuarios autentificados"
::Se añeden los permisos a la carpeta mediante el grupo Informatica_R
::OI - Object inherit    - This folder and files. (no inheritance to subfolders)
::CI - Container inherit - This folder and subfolders.
::Con la combinación de OI-CI, se aplican los permisos al directorio actual, subdirectorios (CI) y ficheros (OI).
icacls C:\Documentación\Informatica /GRANT Informatica_RW:(OI)(CI)(R)

::Referencia
::https://ss64.com/nt/icacls.html
