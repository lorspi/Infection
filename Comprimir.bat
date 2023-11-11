@echo off
setlocal enabledelayedexpansion

set "carpeta_origen=overworld\day"
set "carpeta_destino=overworld\comprimidas"

if not exist "%carpeta_destino%" mkdir "%carpeta_destino%"

set "contador_procesadas=0"
set "contador_total=0"

rem Contar la cantidad total de imágenes
for /f %%i in ('dir /b /a-d "%carpeta_origen%\*.png" ^| find /c /v ""') do set "contador_total=%%i"

for %%i in ("%carpeta_origen%\*.png") do (
    set /a "contador_procesadas+=1"
    echo Procesando imagen %%i - !contador_procesadas! de !contador_total!
    pngquant --output "%carpeta_destino%\%%~nxi" "%%i"
)

echo Proceso completado.
