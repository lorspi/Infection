@echo off
set "carpeta_origen=originales"
set "carpeta_destino=comprimidas"

if not exist "%carpeta_destino%" mkdir "%carpeta_destino%"

for %%i in ("%carpeta_origen%\*.png") do (
    echo Comprimiendo "%%i"
    pngquant --output "%carpeta_destino%\%%~nxi" "%%i"
)

echo Proceso completado.
