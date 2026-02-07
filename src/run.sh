#!/bin/bash

echo "===================================="
echo "Scientific Calculator - Build Script"
echo "===================================="
echo ""

# Set JavaFX Path - CHANGE THIS TO YOUR JAVAFX SDK PATH
JAVAFX_PATH="/path/to/javafx-sdk-21/lib"

# Check if path exists
if [ ! -d "$JAVAFX_PATH" ]; then
    echo "ERROR: JavaFX SDK not found at $JAVAFX_PATH"
    echo "Please edit this script and set the correct JAVAFX_PATH"
    exit 1
fi

echo "Using JavaFX from: $JAVAFX_PATH"
echo ""

# Create output directory
mkdir -p out/calculator

echo "[1/3] Compiling Java files..."
javac --module-path "$JAVAFX_PATH" --add-modules javafx.controls,javafx.fxml -d out CalculatorApp.java CalculatorController.java CalculatorLogic.java

if [ $? -ne 0 ]; then
    echo ""
    echo "ERROR: Compilation failed!"
    exit 1
fi

echo "[2/3] Copying CSS file..."
cp calculator-styles.css out/calculator/

echo "[3/3] Running application..."
echo ""
java --module-path "$JAVAFX_PATH" --add-modules javafx.controls,javafx.fxml -cp out calculator.CalculatorApp

if [ $? -ne 0 ]; then
    echo ""
    echo "ERROR: Application failed to run!"
    exit 1
fi

echo ""
echo "Done!"
