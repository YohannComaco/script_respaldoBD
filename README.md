# SCRIPT PARA RESPALDO DE BASE DE DATOS
## Objetivo 

Este script tiene como objetivo respaldar los Backups diarios realizados por la plataforma DaiBackup de la base de datos de la empresa **Forestal Comaco SA** 

# Instrucciones 

Este script es un archivo ".bat" que se programara de manera automatica usando el "programador de tareas" de Windows para realizar la tarea de manera diaria a una hora especifica a partir de las 23 PM. 

Los archivos seran copiados desde el origen en disco C: hasta el respaldo en disco E: de la maquina **Queule**. 

# Carpeta Origen 
La carpeta de origen de donde se copian los datos es /C:respaldos
# Carpeta Destino
La carpeta de destino donde se reciben los datos es /E:Queule/

# Procedimiento de codigo

El script localiza los archivos de respaldo .bak (Copia de seguridad) y los comprime. Luego de comprimidos los envia a la carpeta destinada a respaldos del servidor *Queule* donde se guardar con el siguiente formato:

> [!NOTE]
> RespaldoBD_dd-mm-yyyy_hora_minutos.rar 

Cada respaldo realizado se guarda en su respectiva carpeta donde se podra encontrar el archivo *.rar* y los registros del copiado de datos. 
