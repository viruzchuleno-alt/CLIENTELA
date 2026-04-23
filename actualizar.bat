@echo off
chcp 65001 >nul
cls

echo.
echo ============================================================
echo   📤 ACTUALIZAR SITIO EN VERCEL
echo ============================================================
echo.

:: Verificar que estamos en un repo Git
git status >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ ERROR: No estás en un repositorio Git
    pause
    exit /b 1
)

echo ✓ Repositorio Git detectado
echo.

:: Mostrar estado actual
echo 📋 Cambios detectados:
echo.
git status --short
echo.

:: Confirmar si quiere continuar
set /p MENSAJE="📝 Describe los cambios (ej: Actualizar botón WhatsApp): "

if "%MENSAJE%"=="" (
    set MENSAJE=Actualización del sitio
)

echo.
echo ============================================================
echo   Preparando actualización...
echo ============================================================
echo.

:: Agregar todos los cambios
echo ✓ Agregando archivos...
git add .

:: Hacer commit
echo ✓ Creando commit...
git commit -m "%MENSAJE%"

if %errorlevel% neq 0 (
    echo.
    echo ⚠ No hay cambios para subir o el commit falló
    pause
    exit /b 0
)

:: Push a GitHub
echo ✓ Subiendo a GitHub...
git push

if %errorlevel% equ 0 (
    echo.
    echo ============================================================
    echo   ✅ ACTUALIZACIÓN EXITOSA
    echo ============================================================
    echo.
    echo 🚀 GitHub actualizado
    echo ⚡ Vercel desplegará automáticamente en ~30 segundos
    echo.
    echo 🌐 Tu sitio: https://clientela.vercel.app
    echo 📊 Dashboard: https://vercel.com/viruzchuleno-alt/clientela
    echo.
    echo ============================================================
    echo.
    echo 💡 TIP: Espera 1 minuto y recarga tu sitio (Ctrl+F5)
    echo.
) else (
    echo.
    echo ============================================================
    echo   ❌ ERROR AL SUBIR
    echo ============================================================
    echo.
    echo Posibles causas:
    echo   • Sin conexión a Internet
    echo   • Problemas de autenticación con GitHub
    echo   • Conflictos en el repositorio
    echo.
    echo Intenta:
    echo   git pull
    echo   git push
    echo.
)

pause
