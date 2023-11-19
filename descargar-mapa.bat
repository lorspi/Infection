@echo off

echo ----------------------------------------------------
echo   Iniciando descarga del zip. Espera unos minutos.
echo ----------------------------------------------------

REM Descargar el archivo ZIP del repositorio
curl -L -o repo.zip https://github.com/lorspi/Infection/archive/main.zip

echo -------------------------------------------------------------
echo   Archivo descargado. Descomprimiendo. Espera unos minutos.
echo -------------------------------------------------------------

REM Descomprimir el archivo ZIP en la carpeta temporal
tar -xf repo.zip --strip-components=1

REM Eliminar archivos temporales
del /q repo.zip
del /q .gitattributes
del /q .gitignore
del /q Comprimir.bat
del /q Comprimir-fuerte.bat-dis
del /q pngquant-windows.zip
del /q pngquant.exe

echo ----------------------------------------
echo   Mapa actualizado satisfactoriamente!
echo ----------------------------------------

pause