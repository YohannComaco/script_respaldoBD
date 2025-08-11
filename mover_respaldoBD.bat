@echo off 

setlocal
REM ORIGEN
set "source=C:\Users\Administrador\Desktop\origen"
REM DESTINO
set "destination=C:\Users\Administrador\Documents\Destomp"
REM PREFIJO FECHA Y HORA (Hora-minutos)
set "hora=%time:~0,2%-%time:~3,2%"
if "%hora:~0,1%"==" " set "hora=0%hora:~1%"
set "today=%date:~0,2%-%date:~3,2%-%date:~6,4%_%hora%" 
REM CARPETA DE RESPALDO
set "carpetaRespaldo=RespaldosBD_%today%"
REM RUTA FINAL DE DESTINO
set "finalDestination=%destination%\%carpetaRespaldo%" 
REM ZIPFILE
set "zipFile=%source%\RespaldoBD_%today%.rar"
REM RUTA WINRAR
set "win_path=C:\Program Files\WinRAR\"


echo =======================================================
echo Iniciando el proceso de respaldo de la base de datos...
echo Origen %source% 
echo Destino %finalDestination% 
echo Archivo ZIP %zipFile%
echo =======================================================

 
if not exist "%finalDestination%" (
    mkdir "%finalDestination%"
)

if not exist "%source%" (
    echo La carpeta de origen no existe. Verifique la ruta e intente nuevamente.
    goto end
) 
REM Comprimir archivos .bak y log en origen
if exist "%source%\*.bak" (
    "%win_path%WinRAR.exe" a -ep1 -m5 "%zipFile%" "%source%\*.bak"

) else (
    echo No se encontraron archivos .bak para comprimir. Proceso abortado.
    goto end
)  

REM Verificar que el archivo comprimido se creó
if not exist "%zipFile%" (
    echo ERROR: El archivo comprimido no se creó correctamente.
    goto end
) 
REM Despues de comprimir .bak eliminar carpeta* 
del /q "%source%\*.bak" 
 
REM /MOV Mover archivos no carpetas, /E Copiar subdirectorios, /V Generar salida detallada, /ETA Mostrar tiempo estimado, /TEE Mostrar en consola y en log
robocopy "%source%" "%finalDestination%" "RespaldoBD_%today%.rar" /MOV /V /ETA /TEE /LOG:"%finalDestination%\REGISTRO_RESPALDO_BD_%today%.txt" /R:3 /W:60
set "rc=%errorlevel%"
if %rc% GEQ 8 (
    echo ERROR: Fallo en copia de archivos.
    goto end
)

echo =======================================================
echo Respaldo completado y empaquetado en:
echo %finalDestination%\RespaldoBD_%today%.rar
echo =======================================================

:end 
endlocal
pause 