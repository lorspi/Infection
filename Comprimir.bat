@echo off
setlocal enabledelayedexpansion

set "carpeta_origen=overworld\day"
set "carpeta_destino=overworld\comprimidas"

if not exist "%carpeta_destino%" mkdir "%carpeta_destino%"

rem Verificar si la carpeta de destino contiene archivos antes de intentar eliminarlos
dir /b "%carpeta_destino%\*.*" >nul 2>nul
if %errorlevel% equ 0 (
    del /Q "%carpeta_destino%\*.*"
    echo Archivos en la carpeta de destino borrados.
) else (
    echo La carpeta de destino ya está vacía.
)

timeout /nobreak /t 2 >nul

set "contador_procesadas=0"
set "contador_total=0"

rem Contar la cantidad total de imágenes
for /f %%i in ('dir /b /a-d "%carpeta_origen%\*.png" ^| find /c /v ""') do set "contador_total=%%i"

for %%i in ("%carpeta_origen%\*.png") do (
    set /a "contador_procesadas+=1"
    rem echo Procesando imagen %%i - !contador_procesadas! de !contador_total!
    echo Procesando imagen !contador_procesadas! de !contador_total!
    pngquant --output "%carpeta_destino%\%%~nxi" "%%i"
)

echo Proceso completado.
