@echo off 
setlocal 
REM RUTA DE WINRAR EN CASO DE QUERER COMPRIMIR
:: set RUTA_WINRAR="C:\Program Files\WinRAR\WinRAR.exe"

REM NOMBRE Y RUTA DE LA BASE DE DATOS RESPECTIVAMENTE 
set "NOMBRE_BD=NOMBRE_BD"
set "RUTA_BACKUP=C:\RUTA-BACKUP"

REM PREFIJO FECHA 
set "today=%date:~0,2%-%date:~3,2%-%date:~6,4%"

if not exist %RUTA_BACKUP% mkdir %RUTA_BACKUP% 

REM Generar CS (Copia de Seguridad)
REM Para copias de seguridad comprimidas se requiere SQL Server y agregar "WITH COMPRESSION" (No soportado por Express)
REM CAMBIAR INSTANCIA DE SQL SERVER SEGUN CORRESPONDA 
echo Iniciando Copia de Seguridad....
sqlcmd -S INSTANCIA\SQL -E -Q  "BACKUP DATABASE [%NOMBRE_BD%] TO DISK='%RUTA_BACKUP%\CS_%NOMBRE_BD%_%today%.bak' WITH INIT, STATS = 10"
if ERRORLEVEL 1 (
    echo ========================================
    echo ERROR: NO SE GENERO COPIA DE SEGURIDAD. 
    echo ========================================
    pause
    exit /b 1
) 
echo ========================================
echo Backup realizado correctamente en:
echo %RUTA_BACKUP%\CS_%NOMBRE_BD%_%today%.bak
echo ========================================

:end