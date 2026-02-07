# Scientific Calculator - JavaFX Application

A modern, feature-rich scientific calculator built with Core Java and JavaFX with a sleek dark theme.

## Features

### Basic Operations
- ✅ Addition (+)
- ✅ Subtraction (-)
- ✅ Multiplication (×)
- ✅ Division (÷)
- ✅ Modulus (%)

### Scientific Functions
- ✅ Trigonometric: sin, cos, tan (in degrees)
- ✅ Logarithmic: log₁₀, ln (natural log)
- ✅ Square root (√)
- ✅ Power (xʸ)
- ✅ Factorial (n!)
- ✅ Pi constant (π)
- ✅ Parentheses support ( )

### UI Features
- ✅ Modern dark theme with gradient buttons
- ✅ Responsive layout
- ✅ Display screen with input/output
- ✅ History display showing previous calculation
- ✅ Calculation history panel (last 10 calculations)
- ✅ Clear (C) and Backspace (⌫) buttons
- ✅ Keyboard input support

### Error Handling
- ✅ Division by zero → "Error"
- ✅ Invalid expressions → "Invalid Input"
- ✅ Unmatched parentheses handling
- ✅ Negative factorial prevention
- ✅ Logarithm of non-positive numbers

## Project Structure

```
calculator/
├── CalculatorApp.java          # Main application class
├── CalculatorController.java   # UI and event handling
├── CalculatorLogic.java        # Mathematical operations
└── calculator-styles.css       # Dark theme styling
```

## Prerequisites

- **Java JDK 11 or higher** (JDK 17 recommended)
- **JavaFX SDK** (if not included with your JDK)

## Setup Instructions

### Option 1: IntelliJ IDEA

1. **Create New JavaFX Project**
   - Open IntelliJ IDEA
   - File → New → Project
   - Select "JavaFX" and configure JDK
   - Click "Create"

2. **Add Source Files**
   - Create a package named `calculator` in `src` folder
   - Copy all `.java` files into `src/calculator/`
   - Copy `calculator-styles.css` into `src/calculator/resources/` 
     (create resources folder if needed)

3. **Update CSS Path in CalculatorApp.java**
   - If you placed CSS in resources folder, update line 19 to:
     ```java
     scene.getStylesheets().add(getClass().getResource("resources/calculator-styles.css").toExternalForm());
     ```

4. **Configure JavaFX**
   - File → Project Structure → Libraries
   - Add JavaFX SDK lib folder if not auto-detected
   - Go to Run → Edit Configurations
   - Add VM options:
     ```
     --module-path /path/to/javafx-sdk/lib --add-modules javafx.controls,javafx.fxml
     ```

5. **Run the Project**
   - Right-click on `CalculatorApp.java`
   - Select "Run 'CalculatorApp.main()'"

### Option 2: VS Code

1. **Install Extensions**
   - Install "Extension Pack for Java"
   - Install "JavaFX Support"

2. **Create Project Folder**
   ```bash
   mkdir ScientificCalculator
   cd ScientificCalculator
   mkdir -p src/calculator/resources
   ```

3. **Add Files**
   - Place all `.java` files in `src/calculator/`
   - Place `calculator-styles.css` in `src/calculator/resources/`

4. **Update CSS Path** (if needed - see IntelliJ step 3)

5. **Configure launch.json**
   Create `.vscode/launch.json`:
   ```json
   {
       "version": "0.2.0",
       "configurations": [
           {
               "type": "java",
               "name": "Calculator",
               "request": "launch",
               "mainClass": "calculator.CalculatorApp",
               "vmArgs": "--module-path /path/to/javafx-sdk/lib --add-modules javafx.controls,javafx.fxml"
           }
       ]
   }
   ```

6. **Run**
   - Press F5 or click "Run" button

### Option 3: Command Line

1. **Compile**
   ```bash
   javac --module-path /path/to/javafx-sdk/lib --add-modules javafx.controls,javafx.fxml -d out src/calculator/*.java
   ```

2. **Copy CSS to output**
   ```bash
   cp src/calculator/calculator-styles.css out/calculator/
   ```

3. **Run**
   ```bash
   java --module-path /path/to/javafx-sdk/lib --add-modules javafx.controls,javafx.fxml -cp out calculator.CalculatorApp
   ```

## Keyboard Shortcuts

| Key | Action |
|-----|--------|
| 0-9 | Number input |
| +, -, *, / | Basic operators |
| Enter | Calculate (=) |
| Backspace | Delete last character |
| Delete/Esc | Clear all (C) |
| . | Decimal point |
| Shift+9 | Open parenthesis ( |
| Shift+0 | Close parenthesis ) |

## Usage Examples

### Basic Calculations
- `5 + 3 × 2` = `11`
- `(5 + 3) × 2` = `16`
- `10 ÷ 3` = `3.3333333333`

### Scientific Functions
- `sin(30)` = `0.5` (30 degrees)
- `log(100)` = `2` (log base 10)
- `√16` = `4`
- `2^8` = `256`
- `5!` = `120`

### Complex Expressions
- `sin(45) + cos(45)` = `1.4142135624`
- `(2 + 3) × (4 - 1)` = `15`
- `log(1000) + ln(e)` ≈ `4` (where e ≈ 2.718)

## Code Architecture

### CalculatorApp.java
- Main entry point
- Initializes JavaFX application
- Loads UI and stylesheet
- Sets up window properties

### CalculatorController.java
- Creates UI components (buttons, displays, history)
- Handles button click events
- Manages keyboard input
- Updates display and history
- Coordinates between UI and logic

### CalculatorLogic.java
- Evaluates mathematical expressions
- Implements Shunting Yard algorithm for operator precedence
- Handles scientific functions (sin, cos, tan, log, ln, sqrt)
- Performs factorial and power calculations
- Error handling for invalid operations

## Error Messages

| Error | Cause |
|-------|-------|
| Error | Division by zero, infinity, or NaN result |
| Invalid Input | Malformed expression, unmatched parentheses |

## Customization

### Changing Theme Colors
Edit `calculator-styles.css`:
- Number buttons: `.number-button` (currently gray)
- Operators: `.operator-button` (currently orange)
- Equals: `.equals-button` (currently green)
- Clear: `.clear-button` (currently red)
- Functions: `.function-button` (currently purple)

### Adding New Functions
1. Add button to `CalculatorController.createButtonPanel()`
2. Add case in `handleButtonClick()`
3. Implement logic in `CalculatorLogic.java`

## Troubleshooting

### "Error: JavaFX runtime components are missing"
- Ensure JavaFX SDK is properly configured
- Add correct VM arguments with module path

### CSS not loading
- Check file path in `CalculatorApp.java` line 19
- Ensure CSS file is in correct location
- Try using absolute path for testing

### Buttons not responding
- Check event handlers in `CalculatorController.createButton()`
- Verify keyboard support is enabled

## License

This project is open source and available for educational purposes.

## Author

Created as a comprehensive JavaFX calculator demonstration project.
