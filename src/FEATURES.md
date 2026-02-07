# Scientific Calculator - Feature Documentation

## Complete Feature List

### 1. Basic Arithmetic Operations
| Operation | Symbol | Example | Result |
|-----------|--------|---------|--------|
| Addition | + | 5 + 3 | 8 |
| Subtraction | - | 10 - 4 | 6 |
| Multiplication | × | 7 × 8 | 56 |
| Division | ÷ | 20 ÷ 4 | 5 |
| Modulus | % | 17 % 5 | 2 |

### 2. Scientific Functions

#### Trigonometric (Input in Degrees)
| Function | Button | Example | Result |
|----------|--------|---------|--------|
| Sine | sin | sin(30) | 0.5 |
| Cosine | cos | cos(60) | 0.5 |
| Tangent | tan | tan(45) | 1 |

**Note:** All angles are in degrees, automatically converted to radians internally.

#### Logarithmic
| Function | Button | Example | Result |
|----------|--------|---------|--------|
| Log base 10 | log | log(100) | 2 |
| Natural log | ln | ln(e) | 1 |

**Error Handling:** Returns "Error" for log of non-positive numbers.

#### Power & Root
| Function | Button | Example | Result |
|----------|--------|---------|--------|
| Square | x² | 5x² | 25 |
| Power | xʸ | 2^8 | 256 |
| Square Root | √ | √16 | 4 |

#### Factorial
| Function | Button | Example | Result |
|----------|--------|---------|--------|
| Factorial | n! | 5! | 120 |

**Limitations:** 
- Maximum n = 20 (to prevent overflow)
- No negative factorials

#### Constants
| Constant | Button | Value |
|----------|--------|-------|
| Pi | π | 3.14159265359... |

### 3. Advanced Features

#### Parentheses Support
- Unlimited nested parentheses
- Proper order of operations (PEMDAS)
- Examples:
  - `(2 + 3) × 4 = 20`
  - `2 + (3 × 4) = 14`
  - `((2 + 3) × (4 + 1)) = 25`

#### Expression Evaluation
- Uses Shunting Yard algorithm for correct operator precedence
- Supports complex expressions like: `sin(30) + log(100) × √16`

### 4. User Interface Features

#### Display System
1. **History Display (Top)**
   - Shows the previous calculation
   - Gray text for clarity
   - Automatically populated after calculation

2. **Main Display (Middle)**
   - Shows current input
   - Large, bold white text
   - Real-time input feedback
   - Shows "0" when empty

3. **History Panel (Bottom)**
   - Scrollable list of calculations
   - Stores last 10 calculations
   - Each entry shows: "expression = result"
   - Newest calculations at top

#### Button Categories

**Number Buttons (0-9, .)**
- Dark gray background
- Standard numeric input
- Decimal point support

**Operator Buttons (+, -, ×, ÷, %, xʸ)**
- Orange gradient
- Stands out for easy identification
- All basic and power operations

**Function Buttons (sin, cos, tan, log, ln, √, x², n!, π, (, ))**
- Purple gradient
- Scientific functions
- Automatically adds parentheses for functions

**Control Buttons**
- **Clear (C)** - Red, clears everything
- **Backspace (⌫)** - Red, removes last character
- **Equals (=)** - Green, calculates result (spans full width)

### 5. Input Methods

#### Mouse Input
- Click any button to input
- Hover effects on all buttons
- Press animation for tactile feedback

#### Keyboard Input
| Key(s) | Action |
|--------|--------|
| 0-9 | Number input |
| Numpad 0-9 | Number input |
| + | Addition |
| - (or Minus) | Subtraction |
| * (or Multiply) | Multiplication |
| / (or Divide) | Division |
| . (or Decimal) | Decimal point |
| Enter | Calculate (=) |
| Backspace | Delete last character |
| Delete or Esc | Clear all |
| Shift+9 | Open parenthesis ( |
| Shift+0 | Close parenthesis ) |

### 6. Error Handling

#### Error Messages
| Message | Triggers |
|---------|----------|
| "Error" | Division by zero, infinity, NaN, negative log |
| "Invalid Input" | Malformed expression, unmatched parentheses |

#### Prevented Errors
- **Division by Zero**: Caught and displays "Error"
- **Modulus by Zero**: Caught and displays "Error"
- **Factorial of Negative**: Caught and displays "Invalid Input"
- **Factorial > 20**: Prevents overflow
- **Logarithm of ≤ 0**: Caught and displays "Error"
- **Unmatched Parentheses**: Caught and displays "Invalid Input"
- **Empty Expression**: Returns "0"

### 7. Display Formatting

#### Number Formatting
- **Whole Numbers**: Displayed without decimal (e.g., "5" not "5.0")
- **Decimals**: Up to 10 decimal places, trailing zeros removed
- **Scientific Notation**: Not currently supported (future enhancement)

#### Result Continuation
- After calculation, result remains in input
- Can continue calculating with result
- Clear (C) to start fresh

### 8. Visual Design

#### Dark Theme Color Scheme
- **Background**: Dark gray (#1e1e1e)
- **Displays**: Darker gray (#2d2d30)
- **Number Buttons**: Medium gray with gradient
- **Operators**: Orange gradient (#ff9500)
- **Functions**: Purple gradient (#5e5ce6)
- **Equals**: Green gradient (#34c759)
- **Clear**: Red gradient (#ff3b30)

#### Interactive Effects
- **Hover**: Slight scale up (1.02x) + enhanced shadow
- **Press**: Slight scale down (0.98x)
- **Shadows**: Depth effect for modern look

#### Typography
- **Font Family**: Segoe UI (fallback to Arial, sans-serif)
- **Display**: 28px bold for main, 16px for history
- **Buttons**: 16px for most, 14px for functions
- **History Items**: 12px monospace font

### 9. Code Architecture

#### Separation of Concerns
1. **CalculatorApp.java**
   - JavaFX initialization
   - Scene and stage setup
   - CSS loading

2. **CalculatorController.java**
   - UI component creation
   - Event handling
   - User input processing
   - Display updates
   - History management

3. **CalculatorLogic.java**
   - Mathematical operations
   - Expression parsing
   - Function evaluation
   - Error detection

#### Design Patterns Used
- **MVC Pattern**: Separation of Model (Logic), View (UI), Controller
- **Event-Driven**: All interactions via events
- **Stack-Based Evaluation**: Shunting Yard algorithm

### 10. Performance Characteristics

#### Speed
- Instant calculation for most operations
- Factorial limited to n≤20 for performance
- Efficient expression parsing

#### Memory
- History limited to 10 items
- Lightweight UI components
- No memory leaks from proper JavaFX lifecycle

### 11. Accessibility Features

#### Keyboard Navigation
- Full keyboard support
- No mouse required
- Standard key bindings

#### Visual Clarity
- High contrast dark theme
- Large, readable fonts
- Color-coded button categories

### 12. Extensibility

#### Easy to Add:
- **New Functions**: Add to CalculatorLogic
- **New Buttons**: Add to button grid
- **New Theme**: Modify CSS file
- **Additional History**: Change limit in controller

#### Potential Enhancements:
- Scientific notation for large/small numbers
- Angle mode toggle (degrees/radians)
- Memory functions (M+, M-, MR, MC)
- Graphing capabilities
- Equation solver
- Unit conversion
- Programmable functions

### 13. Testing Recommendations

#### Basic Tests
```
Test: 2 + 2
Expected: 4

Test: 10 - 5
Expected: 5

Test: 3 × 4
Expected: 12

Test: 15 ÷ 3
Expected: 5

Test: 17 % 5
Expected: 2
```

#### Parentheses Tests
```
Test: (2 + 3) × 4
Expected: 20

Test: 2 + (3 × 4)
Expected: 14

Test: ((1 + 2) × (3 + 4))
Expected: 21
```

#### Scientific Tests
```
Test: sin(30)
Expected: 0.5

Test: cos(60)
Expected: 0.5

Test: tan(45)
Expected: 1

Test: log(1000)
Expected: 3

Test: ln(e) where e ≈ 2.718
Expected: 1

Test: √16
Expected: 4

Test: 2^10
Expected: 1024

Test: 5!
Expected: 120
```

#### Error Tests
```
Test: 5 ÷ 0
Expected: Error

Test: log(-5)
Expected: Error

Test: (-3)!
Expected: Invalid Input

Test: (2 + 3
Expected: Invalid Input
```

### 14. Browser/Platform Compatibility

#### Tested On:
- Windows 10/11
- macOS
- Linux (Ubuntu, Fedora)

#### Requirements:
- Java 11+ (Java 17 recommended)
- JavaFX SDK 11+
- 100MB free RAM
- 1024×768 minimum screen resolution

---

## Summary Statistics

- **Total Features**: 20+
- **Button Count**: 30
- **Operations Supported**: 15+
- **Lines of Code**: ~800
- **CSS Rules**: 30+
- **Error Types Handled**: 6+
- **Keyboard Shortcuts**: 15+

---

## Version History

**v1.0** - Initial Release
- All basic and scientific operations
- Dark theme UI
- Keyboard support
- Calculation history
- Error handling
