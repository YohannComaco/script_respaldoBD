# SCRIPT PARA RESPALDO DE BASE DE DATOS
**Forestal Comaco SA** 

## Objetivos 

El script *mover_respaldoBD* tiene como objetivo respaldar los Backups diarios realizados de la bases de datos *BDFLEXLINE* *Phoenix* *Phoenix_Archivos* en disco externo exclusivo para almacenar los respaldos.

El script *copia_seguridadBD* tiene como objetivo generar las copia de seguridad de colecciones especificas en motor de bases de datos SQL EXPRESS. 

# Instrucciones 

Estos script son archivos ".bat" que se programaran de manera automatica usando el "programador de tareas" de Windows para realizar las tareas diariamente

Para **copia_seguridadBD**: Genera archivo *.bak* de copia de seguirad de la coleccion en una ruta de respaldo especifica. Esta tarea esta programada para realizarse todos los dias a las  *hora*. 

# Base de datos (NOMBRE_BD)
Base de datos/Coleccion que se quiere generar el respaldo. 
# Ruta respaldo (RUTA_BACKUP)
Ruta donde se quiere almacenar copia de seguiridad. 
# Instancia SQL 
Instancia de SQL donde esta ubicado la coleccion a respaldar.   

Para **mover_respaldoBD**: Los archivos seran copiados desde el origen en disco C: hasta el respaldo en disco E: de la maquina **Queule**. Esta tarea esta programada para realizarse todos los dias a las *3 am* luego de realizarse el respaldo de las bases de datos.

# Carpeta Origen (SOURCE)
La carpeta de origen de donde se copian los datos es C:\respaldos
# Carpeta Destino (DESTINATION)
La carpeta de destino donde se reciben los datos es E:\Queule\Respaldos

# Procedimiento de codigo mover_respaldoBD

El script localiza los archivos de respaldo .bak (Copia de seguridad) en el directorio de origen y los comprime. Luego de comprimidos los envia a la carpeta destinada a respaldos del servidor *Queule* donde se guardar con el siguiente formato:

> [!IMPORTANT]
> RespaldoBD_dd-mm-yyyy_hora_minutos.rar 

Cada respaldo realizado se guarda en su respectiva carpeta donde se podra encontrar el archivo *.rar* y los registros del copiado de datos. Estos registron tienen informacion como la hora y fecha de finalizacion, archivos omitidos, archivos dañados y posibles errores. 

# Pasos especificos 

Para usar efectivamente este script es necesario modificar las rutas de origen y destino de donde se guardaran los respaldos de los archivos *.bak*. 

# Procedimiento de codigo copia_seguridadBD

El script localiza la BD que se quiere respaldar y genera el archivo *.bak*  en la ruta definida para respaldo donde se almacena con el siguiente formato: 

> [!IMPORTANT]
> CS_NOMBRE_BD_dd-mm-yyyy.bak 

Cada copia de seguridad si se completa se sobreescribe en la ruta de respaldo. 

# Pasos especificos 

Para usar efectivamente este script es necesario modificar el nombre de la base de datos, ruta de backup y la instancia de SQL donde esta la coleccion a respaldar.