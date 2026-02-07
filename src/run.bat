@echo off
echo ====================================
echo Scientific Calculator - Build Script
echo ====================================
echo.

REM Set JavaFX Path - CHANGE THIS TO YOUR JAVAFX SDK PATH
set JAVAFX_PATH=%TEMP%\javafx-sdk-21.0.1\lib

REM Check if path exists
if not exist "%JAVAFX_PATH%" (
    echo ERROR: JavaFX SDK not found at %JAVAFX_PATH%
    echo Please edit this script and set the correct JAVAFX_PATH
    pause
    exit /b 1
)

echo Using JavaFX from: %JAVAFX_PATH%
echo.

REM Check if compiled classes exist
if not exist "out\calculator\CalculatorApp.class" (
    echo ERROR: Compiled classes not found!
    echo Please ensure the project has been compiled first.
    pause
    exit /b 1
)

echo [1/1] Running application...
echo.
java --module-path "%JAVAFX_PATH%" --add-modules javafx.controls,javafx.fxml -cp out calculator.CalculatorApp

if errorlevel 1 (
    echo.
    echo ERROR: Application failed to run!
    pause
    exit /b 1
)

echo.
echo Done!
