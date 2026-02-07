# Quick Start Guide

## Fastest Way to Run (IntelliJ IDEA)

### Step 1: Create JavaFX Project
1. Open IntelliJ IDEA
2. File → New → Project
3. Select "JavaFX" from left panel
4. Name: "ScientificCalculator"
5. Click "Create"

### Step 2: Add Files
1. In the project explorer, navigate to `src/`
2. Create package: Right-click `src` → New → Package → Name it `calculator`
3. Copy these files into `src/calculator/`:
   - CalculatorApp.java
   - CalculatorController.java
   - CalculatorLogic.java

4. Create resources folder: Right-click `calculator` → New → Directory → Name it `resources`
5. Copy `calculator-styles.css` into `src/calculator/resources/`

### Step 3: Update CSS Path
Open `CalculatorApp.java` and modify line 19:

**Change from:**
```java
scene.getStylesheets().add(getClass().getResource("calculator-styles.css").toExternalForm());
```

**Change to:**
```java
scene.getStylesheets().add(getClass().getResource("resources/calculator-styles.css").toExternalForm());
```

### Step 4: Run
1. Right-click on `CalculatorApp.java`
2. Select "Run 'CalculatorApp.main()'"
3. Calculator window should open!

---

## Alternative: Simple Folder Structure (No Resources Folder)

If you want to keep it simple, place CSS in the same folder as Java files:

### File Structure:
```
src/
└── calculator/
    ├── CalculatorApp.java
    ├── CalculatorController.java
    ├── CalculatorLogic.java
    └── calculator-styles.css
```

### CSS Loading Code:
In `CalculatorApp.java`, line 19 should be:
```java
scene.getStylesheets().add(getClass().getResource("calculator-styles.css").toExternalForm());
```

---

## For VS Code Users

### Prerequisites:
```bash
# Install OpenJDK with JavaFX (easiest option)
# Download from: https://openjfx.io/
```

### Project Setup:
```bash
# 1. Create project folder
mkdir ScientificCalculator
cd ScientificCalculator

# 2. Create source structure
mkdir -p src/calculator

# 3. Copy all .java files to src/calculator/
# 4. Copy calculator-styles.css to src/calculator/
```

### launch.json Configuration:
Create `.vscode/launch.json`:
```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "java",
            "name": "Scientific Calculator",
            "request": "launch",
            "mainClass": "calculator.CalculatorApp",
            "projectName": "ScientificCalculator",
            "vmArgs": "--module-path \"C:/path/to/javafx-sdk-21/lib\" --add-modules javafx.controls,javafx.fxml"
        }
    ]
}
```

**Important:** Replace `C:/path/to/javafx-sdk-21/lib` with your actual JavaFX SDK path.

### Run:
- Press `F5` or click the Run button

---

## Command Line Compilation

### On Windows:
```bash
# Set JavaFX path
set PATH_TO_FX="C:\path\to\javafx-sdk-21\lib"

# Compile
javac --module-path %PATH_TO_FX% --add-modules javafx.controls,javafx.fxml -d out src/calculator/*.java

# Copy CSS
copy src\calculator\calculator-styles.css out\calculator\

# Run
java --module-path %PATH_TO_FX% --add-modules javafx.controls,javafx.fxml -cp out calculator.CalculatorApp
```

### On Linux/Mac:
```bash
# Set JavaFX path
PATH_TO_FX="/path/to/javafx-sdk-21/lib"

# Compile
javac --module-path $PATH_TO_FX --add-modules javafx.controls,javafx.fxml -d out src/calculator/*.java

# Copy CSS
cp src/calculator/calculator-styles.css out/calculator/

# Run
java --module-path $PATH_TO_FX --add-modules javafx.controls,javafx.fxml -cp out calculator.CalculatorApp
```

---

## Common Issues & Solutions

### Issue 1: "JavaFX runtime components are missing"
**Solution:** Add VM arguments with JavaFX module path
```
--module-path /path/to/javafx-sdk/lib --add-modules javafx.controls,javafx.fxml
```

### Issue 2: CSS file not found
**Solutions:**
- Check file path in CalculatorApp.java line 19
- Ensure CSS is in correct folder
- Try placing CSS in same folder as .java files

### Issue 3: Blank window appears
**Solution:** Check console for errors, usually CSS loading issue

### Issue 4: Compilation errors about JavaFX classes
**Solution:** 
- Ensure JavaFX SDK is in classpath
- Add JavaFX library in IDE (IntelliJ: File → Project Structure → Libraries)

---

## Testing the Calculator

Once running, try these:

### Basic Math:
- `5 + 3` → `8`
- `10 - 4` → `6`
- `7 × 8` → `56`
- `15 ÷ 3` → `5`

### Parentheses:
- `(2 + 3) × 4` → `20`
- `2 + (3 × 4)` → `14`

### Scientific:
- `sin(30)` → `0.5`
- `cos(60)` → `0.5`
- `log(100)` → `2`
- `√16` → `4`
- `2^10` → `1024`
- `5!` → `120`

### Keyboard:
- Type numbers and operators
- Press Enter for equals
- Backspace to delete
- Esc to clear

---

## File Descriptions

| File | Purpose | Lines |
|------|---------|-------|
| CalculatorApp.java | Main entry, launches app | ~40 |
| CalculatorController.java | UI creation, event handling | ~350 |
| CalculatorLogic.java | Math operations, evaluation | ~400 |
| calculator-styles.css | Dark theme styling | ~150 |

---

## Support

If you encounter issues:
1. Check Java version: `java -version` (should be 11+)
2. Check JavaFX installation
3. Verify file paths in code
4. Check console for error messages

---

Enjoy your Scientific Calculator! 🧮
