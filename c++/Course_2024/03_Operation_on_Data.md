
# 1.3 Operation on data 

## 1.3.1 Arithmetic Operators

C++ provides basic arithmetic operators to perform mathematical operations on numeric types such as `int`, `double`, etc.

**Main Arithmetic Operators**

- `+` → Addition  
- `-` → Subtraction  
- `*` → Multiplication  
- `/` → Division  
- `%` → Modulus (remainder of integer division)  

**Key Points**

- When both operands are integers, division performs **integer division** (fractional part is discarded).
- The modulus operator `%` works only with **integer types**.
- The result type depends on the operand types.

```{code-block} cpp
#include <iostream>

int main(int argc, char *argv[]) {

  // Addition
  int number1{2};
  int number2{11};

  int result = number1 + number2;  // 2 + 11
  std::cout << "result: " << result << std::endl;

  // Subtraction
  result = number2 - number1;      // 11 - 2
  std::cout << "result: " << result << std::endl;

  result = number1 - number2;      // 2 - 11 (negative result)
  std::cout << "result: " << result << std::endl;

  // Multiplication
  result = number2 * number1;      // 11 * 2
  std::cout << "result: " << result << std::endl;

  // Division (integer division: no decimals kept)
  result = number2 / number1;      // 11 / 2 = 5 (not 5.5)
  std::cout << "result: " << result << std::endl;

  // Modulus (remainder after division)
  result = number2 % number1;      // 11 % 2 = 1
  std::cout << "result: " << result << std::endl;

  return 0;
}
```
 
## 1.3.2 Increment and Decrement Operators

C++ provides special operators to increase or decrease a variable by one.

**Operators**

- `++` → Increment (adds 1)
- `--` → Decrement (subtracts 1)

These operators can be used in two forms:

- **Postfix** → `value++` or `value--`
- **Prefix** → `++value` or `--value`

**Key Difference**

- **Postfix**: returns the current value, then modifies it.
- **Prefix**: modifies the value first, then returns it.

```{code-block} cpp
#include <iostream>

int main(int argc, char *argv[]) {
  int value{5};

  // Increment by one (manual form)
  value = value + 1;
  std::cout << "The value is: " << value << std::endl;

  // Decrement by one (manual form)
  value = 5;
  value = value - 1;
  std::cout << "The value is: " << value << std::endl;

  std::cout << std::endl;

  // Postfix increment and decrement
  std::cout << "======== Postfix increment and decrement ========" << std::endl;

  value = 5;

  std::cout << "The value is (value++): " << value++ << std::endl; // prints 5, then increments
  std::cout << "The value is: " << value << std::endl;             // 6

  std::cout << std::endl;

  value = 5;

  std::cout << "The value is (value--): " << value-- << std::endl; // prints 5, then decrements
  std::cout << "The value is: " << value << std::endl;             // 4

  std::cout << std::endl;

  // Prefix increment and decrement
  std::cout << "======== Prefix increment and decrement ========" << std::endl;

  value = 5;

  ++value;  // increments first
  std::cout << "The value is (++value): " << value << std::endl; // 6

  value = 5;
  std::cout << "The value is (++value in place): " << ++value
            << std::endl; // increments, then prints 6

  std::cout << std::endl;

  value = 5;

  --value;  // decrements first
  std::cout << "The value is (--value): " << value << std::endl; // 4

  value = 5;
  std::cout << "The value is (--value in place): " << --value
            << std::endl; // decrements, then prints 4

  return 0;
}
```

## 1.3.3 Compound Assignment Operators

Compound assignment operators combine an arithmetic operation with assignment.


Instead of writing:

```{code-block} cpp
value = value + 5;
```

You can write:

```{code-block} cpp
value += 5;
```


**Main Compound Operators**

- `+=` → Addition assignment  
- `-=` → Subtraction assignment  
- `*=` → Multiplication assignment  
- `/=` → Division assignment  
- `%=` → Modulus assignment  

**Key Point**

These operators modify the variable **in place** and are more concise than writing the full expression.

```{code-block} cpp
#include <iostream>

// Compound Operators
int main(int argc, char *argv[]) {

  int value{45};
  std::cout << "value: " << value << std::endl;

  value += 5;   // value = value + 5
  std::cout << "value after += 5: " << value << std::endl; // 50

  value -= 5;   // value = value - 5
  std::cout << "value after -= 5: " << value << std::endl; // 45

  value *= 2;   // value = value * 2
  std::cout << "value after *= 2: " << value << std::endl; // 90

  value /= 3;   // value = value / 3 (integer division)
  std::cout << "value after /= 3: " << value << std::endl; // 30

  value %= 11;  // value = value % 11 (remainder)
  std::cout << "value after %= 11: " << value << std::endl; // 8

  return 0;
}
```

## 1.3.4 Comparison Operators

Comparison (relational) operators are used to compare two values.  
They return a `bool` (`true` or `false`).

**Main Comparison Operators**

- `<`   → less than  
- `<=`  → less than or equal to  
- `>`   → greater than  
- `>=`  → greater than or equal to  
- `==`  → equal to  
- `!=`  → not equal to  

`std::boolalpha` is used to print `true` / `false` instead of `1` / `0`.

```{code-block} cpp
#include <ios>
#include <iostream>

int main() {

  int number1{41};
  int number2{62};

  std::cout << "Number 1: " << number1 << std::endl;
  std::cout << "Number 2: " << number2 << std::endl;

  std::cout << std::endl;
  std::cout << "Comparing variables:" << std::endl;

  // Print booleans as true/false instead of 1/0
  std::cout << std::boolalpha;

  std::cout << "Number 1 < Number 2:  " << (number1 < number2) << std::endl;
  std::cout << "Number 1 <= Number 2: " << (number1 <= number2) << std::endl;
  std::cout << "Number 1 > Number 2:  " << (number1 > number2) << std::endl;
  std::cout << "Number 1 >= Number 2: " << (number1 >= number2) << std::endl;
  std::cout << "Number 1 == Number 2: " << (number1 == number2) << std::endl;
  std::cout << "Number 1 != Number 2: " << (number1 != number2) << std::endl;

  std::cout << std::endl;
  std::cout << "Store comparison result and use it later:" << std::endl;

  // Store comparison result in a boolean variable
  bool result{number1 == number2};

  std::cout << number1 << " == " << number2 
            << " : " << result << std::endl;

  return 0;
}
```

 
## 1.3.5 Logical Operators

Logical operators operate on boolean values (`bool`) and return a boolean result.

**Logical Operators**

- `&&` → Logical AND  
- `||` → Logical OR  
- `!`  → Logical NOT  


- Logical operator precedence:
  1. `!`
  2. `&&`
  3. `||`
- `&&` is `true` only if *all* operands are `true`.
- `||` is `true` if *at least one* operand is `true`.
- `!` inverts a boolean value.
- Logical operators use **short-circuit evaluation**:
  - `A && B` → if `A` is `false`, `B` is not evaluated.
  - `A || B` → if `A` is `true`, `B` is not evaluated.

```{code-block} cpp
#include <iostream>

int main() {

  bool a{true};
  bool b{false};
  bool c{true};

  // Print booleans as true/false instead of 1/0
  std::cout << std::boolalpha;

  std::cout << "a: " << a << std::endl;
  std::cout << "b: " << b << std::endl;
  std::cout << "c: " << c << std::endl;

  // =======================
  // AND Operator (&&)
  // True only if all operands are true
  // =======================
  std::cout << std::endl;
  std::cout << "Basic AND Operations" << std::endl;

  std::cout << "a && b: " << (a && b) << std::endl;
  std::cout << "a && c: " << (a && c) << std::endl;
  std::cout << "a && b && c: " << (a && b && c) << std::endl;

  // =======================
  // OR Operator (||)
  // True if at least one operand is true
  // =======================
  std::cout << std::endl;
  std::cout << "Basic OR Operations" << std::endl;

  std::cout << "a || b: " << (a || b) << std::endl;
  std::cout << "a || c: " << (a || c) << std::endl;
  std::cout << "a || b || c: " << (a || b || c) << std::endl;

  // =======================
  // NOT Operator (!)
  // Negates the operand
  // =======================
  std::cout << std::endl;
  std::cout << "Basic NOT Operations" << std::endl;

  std::cout << "!a: " << !a << std::endl;
  std::cout << "!b: " << !b << std::endl;
  std::cout << "!c: " << !c << std::endl;

  // =======================
  // Combining logical operators
  // =======================
  std::cout << std::endl;
  std::cout << "Combining logical operators" << std::endl;

  // Parentheses improve clarity and avoid precedence confusion
  std::cout << "!(a && b) || c: " 
            << (!(a && b) || c) << std::endl;

  // =======================
  // Logical + Relational Operators
  // =======================

  int d{45};
  int e{20};
  int f{11};

  std::cout << std::endl;
  std::cout << "Relational and logical operations on integers" << std::endl;

  std::cout << "d: " << d << std::endl;
  std::cout << "e: " << e << std::endl;
  std::cout << "f: " << f << std::endl;

  std::cout << std::endl;

  std::cout << "(d > e) && (d > f): "
            << ((d > e) && (d > f)) << std::endl;

  std::cout << "(d == e) || (e <= f): "
            << ((d == e) || (e <= f)) << std::endl;

  std::cout << "(d < e) || (d > f): "
            << ((d < e) || (d > f)) << std::endl;

  std::cout << "(f > e) || (d < f): "
            << ((f > e) || (d < f)) << std::endl;

  std::cout << "(d > f) && (f <= d): "
            << ((d > f) && (f <= d)) << std::endl;

  std::cout << "(d > e) && (d <= f): "
            << ((d > e) && (d <= f)) << std::endl;

  std::cout << "!a && (d == e): "
            << (!a && (d == e)) << std::endl;

  std::cout << "!a || (d == e): "
            << (!a || (d == e)) << std::endl;

  return 0;
}
```



## 1.3.6 Stream Manipulators Reference

| Manipulator(s) | Header | Purpose |
|----------------|--------|----------|
| `std::endl` | `<ostream>` | Inserts a new line character and flushes the stream. |
| `std::flush` | `<ostream>` | Flushes the output stream buffer. |
| `std::setw(n)` | `<iomanip>` | Sets the field width for the next input/output operation. |
| `std::left`, `std::right`, `std::internal` | `<ios>` | Controls value justification (alignment) within a field. |
| `std::boolalpha`, `std::noboolalpha` | `<ios>` | Switches between textual (true/false) and numeric (1/0) bool output. |
| `std::showpos`, `std::noshowpos` | `<ios>` | Controls the display of the + sign for positive numbers. |
| `std::dec`, `std::hex`, `std::oct` | `<ios>` | Sets the base for integer I/O (Decimal, Hexadecimal, or Octal). |
| `std::showbase`, `std::noshowbase` | `<ios>` | Controls whether the numeric base prefix (e.g., 0x) is shown. |
| `std::uppercase`, `std::nouppercase` | `<ios>` | Controls if hex digits and scientific notation use capital letters. |
| `std::fixed`, `std::scientific` | `<ios>` | Sets floating-point format to fixed-point or scientific notation. |
| `std::setprecision(n)` | `<iomanip>` | Sets the number of decimal places or significant digits. |
| `std::setfill(c)` | `<iomanip>` | Sets the character used to fill empty space in a width-restricted field. |
| `std::showpoint`, `std::noshowpoint` | `<ios>` | Forces or hides the decimal point and trailing zeros. |

```{code-block} cpp
#include <iomanip>
#include <iostream>

int main(int argc, char *argv[]) {
  // std::endl: places a new line character on the output stream, this is
  // identical to placing '\n' on the output stream.
  std::cout << "Hello";
  std::cout << "World";

  std::cout << std::endl;
  std::cout << "-------------------" << std::endl;

  std::cout << "Hello" << std::endl;
  std::cout << "World" << std::endl;

  std::cout << std::endl;
  std::cout << "Hello\n";
  std::cout << "World\n";

  //===================================================================
  std::cout << std::endl;

  // std::flush : flushes the output buffer to its final destination.
  std::cout << "This is a nice message...." << std::endl << std::flush;
  // After this std::flush, we're sure that at this line, the message has been
  // sent to the stream. This may be important in some applications.

  //===================================================================
  std::cout << std::endl;

  // std::setw() : Adjusts the field with for the item about to be printed.
  // The setw() manipulator only affects the next value to be printed.

  std::cout << "Unformatted table : " << std::endl;
  std::cout << "Daniel" << " " << "Gray" << " 25" << std::endl;
  std::cout << "Stanley" << " " << "Woods" << " 33" << std::endl;
  std::cout << "Jordan" << " " << "Parker" << " 45" << std::endl;
  std::cout << "Joe" << " " << "Ball" << " 21" << std::endl;
  std::cout << "Josh" << " " << "Carr" << " 27" << std::endl;
  std::cout << "Izaiah" << " " << "Robinson" << " 29" << std::endl;

  std::cout << std::endl;
  std::cout << "Formatted table : " << std::endl;

  std::cout << std::setw(10) << "Lastname" << std::setw(10) << "Firstname"
            << std::setw(5) << "Age" << std::endl;
  std::cout << std::setw(10) << "Daniel" << std::setw(10) << "Gray"
            << std::setw(5) << "25" << std::endl;
  std::cout << std::setw(10) << "Stanley" << std::setw(10) << "Woods"
            << std::setw(5) << "33" << std::endl;
  std::cout << std::setw(10) << "Jordan" << std::setw(10) << "Parker"
            << std::setw(5) << "45" << std::endl;
  std::cout << std::setw(10) << "Joe" << std::setw(10) << "Ball" << std::setw(5)
            << "21" << std::endl;
  std::cout << std::setw(10) << "Josh" << std::setw(10) << "Carr"
            << std::setw(5) << "27" << std::endl;
  std::cout << std::setw(10) << "Izaiah" << std::setw(10) << "Robinson"
            << std::setw(5) << "29" << std::endl;

  std::cout << std::endl;
  std::cout << "Formatted table with variables: " << std::endl;

  int col_width{14};

  std::cout << std::setw(col_width) << "Lastname" << std::setw(col_width)
            << "Firstname" << std::setw(col_width / 2) << "Age" << std::endl;
  std::cout << std::setw(col_width) << "Daniel" << std::setw(col_width)
            << "Gray" << std::setw(col_width / 2) << "25" << std::endl;
  std::cout << std::setw(col_width) << "Stanley" << std::setw(col_width)
            << "Woods" << std::setw(col_width / 2) << "33" << std::endl;
  std::cout << std::setw(col_width) << "Jordan" << std::setw(col_width)
            << "Parker" << std::setw(col_width / 2) << "45" << std::endl;
  std::cout << std::setw(col_width) << "Joe" << std::setw(col_width) << "Ball"
            << std::setw(col_width / 2) << "21" << std::endl;
  std::cout << std::setw(col_width) << "Josh" << std::setw(col_width) << "Carr"
            << std::setw(col_width / 2) << "27" << std::endl;
  std::cout << std::setw(col_width) << "Izaiah" << std::setw(col_width)
            << "Robinson" << std::setw(col_width / 2) << "29" << std::endl;
  //===================================================================

  // setfill

  std::cout << std::endl;
  std::cout << "Table with fill characters :  " << std::endl;

  col_width = 20;

  std::cout << std::left;
  std::cout << std::setfill('.'); // The fill character
  std::cout << std::setw(col_width) << "Lastname" << std::setw(col_width)
            << "Firstname" << std::setw(col_width / 2) << "Age" << std::endl;
  std::cout << std::setw(col_width) << "Daniel" << std::setw(col_width)
            << "Gray" << std::setw(col_width / 2) << "25" << std::endl;
  std::cout << std::setw(col_width) << "Stanley" << std::setw(col_width)
            << "Woods" << std::setw(col_width / 2) << "33" << std::endl;
  std::cout << std::setw(col_width) << "Jordan" << std::setw(col_width)
            << "Parker" << std::setw(col_width / 2) << "45" << std::endl;
  std::cout << std::setw(col_width) << "Joe" << std::setw(col_width) << "Ball"
            << std::setw(col_width / 2) << "21" << std::endl;
  std::cout << std::setw(col_width) << "Josh" << std::setw(col_width) << "Carr"
            << std::setw(col_width / 2) << "27" << std::endl;
  std::cout << std::setw(col_width) << "Izaiah" << std::setw(col_width)
            << "Robinson" << std::setw(col_width / 2) << "29" << std::endl;
  //===================================================================
  std::cout << std::endl;

  // boolalpha and noboolapha : control bool output format : 1/0 or true/false

  bool condition{true};
  bool other_condition{false};

  std::cout << "condition : " << condition << std::endl;
  std::cout << "other_condition : " << other_condition << std::endl;

  std::cout << std::endl;
  std::cout << std::boolalpha;
  std::cout << "condition : " << condition << std::endl;
  std::cout << "other_condition : " << other_condition << std::endl;

  std::cout << std::endl;
  std::cout << std::noboolalpha;
  std::cout << "condition : " << condition << std::endl;
  std::cout << "other_condition : " << other_condition << std::endl;

  //===================================================================
  std::cout << std::endl;

  // showpos and noshowpos : show or hide the +  sign for positive numbers

  int pos_num{34};
  int neg_num{-45};

  std::cout << "pos_num : " << pos_num << std::endl;
  std::cout << "neg_num : " << neg_num << std::endl;

  std::cout << std::endl;
  std::cout << std::showpos;
  std::cout << "pos_num : " << pos_num << std::endl;
  std::cout << "neg_num : " << neg_num << std::endl;

  std::cout << std::endl;
  std::cout << std::noshowpos;
  std::cout << "pos_num : " << pos_num << std::endl;
  std::cout << "neg_num : " << neg_num << std::endl;

  //===================================================================
  std::cout << std::endl;

  // different number systems : std::dec, std::hex, std::oct

  int pos_int{717171};
  int neg_int{-47347};
  double double_var{498.32};

  std::cout << std::endl;
  std::cout << "default base format : " << std::endl;
  std::cout << "pos_int : " << pos_int << std::endl;
  std::cout << "neg_int : " << neg_int << std::endl;
  std::cout << "double_var : " << double_var << std::endl;

  std::cout << std::endl;
  std::cout << "pos_int in different bases : " << std::endl;
  std::cout << "pos_int (dec) : " << std::dec << pos_int << std::endl;
  std::cout << "pos_int (hex) : " << std::hex << pos_int << std::endl;
  std::cout << "pos_int (oct) : " << std::oct << pos_int << std::endl;

  std::cout << std::endl;
  std::cout << "neg_int in different bases : " << std::endl;
  std::cout << "neg_int (dec) : " << std::dec << neg_int << std::endl;
  std::cout << "neg_int (hex) : " << std::hex << neg_int << std::endl;
  std::cout << "neg_int (oct) : " << std::oct << neg_int << std::endl;

  std::cout << std::endl;
  std::cout << "double_var in different bases : " << std::endl;
  std::cout << "double_var (dec) : " << std::dec << double_var << std::endl;
  std::cout << "double_var (hex) : " << std::hex << double_var << std::endl;
  std::cout << "double_var (oct) : " << std::oct << double_var << std::endl;
  //===================================================================
  std::cout << std::endl;

  // uppercase and nouppercase

  pos_int = 717171;

  std::cout << "pos_int (nouppercase : default) : " << std::endl;
  std::cout << "pos_int (dec) : " << std::dec << pos_int << std::endl;
  std::cout << "pos_int (hex) : " << std::hex << pos_int << std::endl;
  std::cout << "pos_int (oct) : " << std::oct << pos_int << std::endl;

  std::cout << std::endl;
  std::cout << "pos_int (uppercase) : " << std::endl;
  std::cout << std::uppercase;
  std::cout << "pos_int (dec) : " << std::dec << pos_int << std::endl;
  std::cout << "pos_int (hex) : " << std::hex << pos_int << std::endl;
  std::cout << "pos_int (oct) : " << std::oct << pos_int << std::endl;
  //===================================================================
  std::cout << std::endl;

  // fixed and scientific : for floating point values

  double a{3.1415926535897932384626433832795};
  double b{2006.0};
  double c{1.34e-10};

  std::cout << std::endl;
  std::cout << "double values (default : use scientific where necessary) : "
            << std::endl;
  std::cout << "a : " << a << std::endl;
  std::cout << "b : " << b << std::endl;
  std::cout << "c : " << c << std::endl;

  std::cout << std::endl;
  std::cout << "double values (fixed) : " << std::endl;
  std::cout << std::fixed;
  std::cout << "a : " << a << std::endl;
  std::cout << "b : " << b << std::endl;
  std::cout << "c : " << c << std::endl;

  std::cout << std::endl;
  std::cout << "double values (scientific) : " << std::endl;
  std::cout << std::scientific;
  std::cout << "a : " << a << std::endl;
  std::cout << "b : " << b << std::endl;
  std::cout << "c : " << c << std::endl;

  std::cout << std::endl;
  std::cout << "double values (back to defaults) : " << std::endl;
  std::cout.unsetf(std::ios::scientific | std::ios::fixed); // Hack
  std::cout << "a : " << a << std::endl;
  std::cout << "b : " << b << std::endl;
  std::cout << "c : " << c << std::endl;

  //===================================================================
  std::cout << std::endl;

  // setprecision() : the number of digits printed out for a floating point.
  // Default is 6

  a = 3.1415926535897932384626433832795;

  std::cout << std::endl;
  std::cout << "a (default precision(6)) : " << a << std::endl;
  std::cout << std::setprecision(10);
  std::cout << "a (precision(10)) : " << a << std::endl;
  std::cout << std::setprecision(20);
  std::cout << "a (precision(20)) : " << a << std::endl;

  // If the precision is bigger than supported by the type, you'll just print
  // garbage.
  //===================================================================
  std::cout << std::endl;

  // showpoint and noshowpoint : show trailing zeros if necessary
  // Force output of the decimal point

  double d{34.1};
  double e{101.99};
  double f{12.0};
  int g{45};

  std::cout << std::endl;
  std::cout << "noshowpoint (default) : " << std::endl;
  std::cout << "d : " << d << std::endl;
  std::cout << "e : " << e << std::endl;
  std::cout << "f : " << f << std::endl; // 12
  std::cout << "g : " << g << std::endl;

  std::cout << std::endl;
  std::cout << "showpoint: " << std::endl;
  std::cout << std::showpoint;
  std::cout << "d : " << d << std::endl;
  std::cout << "e : " << e << std::endl;
  std::cout << "f : " << f << std::endl; // 12.0
  std::cout << "g : " << g << std::endl;
  return 0;
}

```


## 1.3.7 Numeric Limits 

The `<limits>` header provides compile-time information about the properties of fundamental numeric types through:

```
std::numeric_limits<T>
```

It allows you to query:

- Minimum representable value
- Maximum representable value
- Lowest representable value
- Whether the type is signed
- Number of value bits (precision for integers)

---

Integer types store exact whole numbers. Their range depends on:

- Number of bits
- Signed vs unsigned
- Platform implementation

Typical properties on modern systems:

| Type | Typical Size | Signed Range | Unsigned Range |
|------|-------------|-------------|---------------|
| short | 16 bits | −32,768 to 32,767 | 0 to 65,535 |
| int | 32 bits | −2,147,483,648 to 2,147,483,647 | 0 to 4,294,967,295 |
| long | 32 or 64 bits (platform dependent) | implementation dependent | implementation dependent |

Key facts:

- Signed integers reserve 1 bit for the sign.
- Unsigned integers use all bits for magnitude.
- Signed overflow results in undefined behavior.
- Unsigned overflow wraps around modulo 2ⁿ.

Example:

```
std::numeric_limits<int>::is_signed
```

Returns:
- 1 (true) for signed types
- 0 (false) for unsigned types

```
std::numeric_limits<int>::digits
```

Returns:
- Number of value bits (excluding sign bit)

For a 32-bit signed int:
- digits = 31

---

**Floating-Point Types**

Floating-point types follow the IEEE-754 standard on almost all modern systems.

Available types:

- float  (single precision, typically 32 bits)
- double (double precision, typically 64 bits)
- long double (extended precision, platform dependent)

Floating-point numbers are represented as:

value = sign × mantissa × 2^exponent

This allows representation of:

- Very large numbers
- Very small numbers
- Fractional values

But introduces:

- Rounding errors
- Limited precision

Example:

```
0.1 + 0.2 != 0.3
```

because 0.1 cannot be represented exactly in binary.

---

**Important Difference: min() vs lowest()**

For integers:

- min() → most negative number
- max() → most positive number

For floating-point types:

- min()     → smallest positive normalized number
- lowest()  → most negative representable value
- max()     → largest positive representable value


| Function | Meaning | Approximate Value |
|----------|----------|------------------|
| min() | Smallest positive normalized value | 1.17 × 10^-38 |
| lowest() | Most negative value | −3.4 × 10^38 |
| max() | Largest positive value | 3.4 × 10^38 |

Therefore:

```
std::numeric_limits<float>::min()
```

does NOT give the most negative float.

To get the most negative float, use:

```
std::numeric_limits<float>::lowest()
```

---

**Typical Floating-Point Ranges**

| Type | lowest() | max() | min() |
|------|----------|-------|-------|
| float | ≈ −3.4 × 10^38 | ≈ 3.4 × 10^38 | ≈ 1.17 × 10^-38 |
| double | ≈ −1.7 × 10^308 | ≈ 1.7 × 10^308 | ≈ 2.2 × 10^-308 |
| long double | platform dependent | platform dependent | platform dependent |



```{code-block} cpp
#include <iostream>
#include <limits>

int main(int argc, char *argv[]) {

  std::cout << "The range for short is from "
            << std::numeric_limits<short>::min() << " to "
            << std::numeric_limits<short>::max() << std::endl;

  std::cout << "The range for unsigned short is from "
            << std::numeric_limits<unsigned short>::min() << " to "
            << std::numeric_limits<unsigned short>::max() << std::endl;

  std::cout << "The range for int is from " << std::numeric_limits<int>::min()
            << " to " << std::numeric_limits<int>::max() << std::endl;

  std::cout << "The range for unsigned int is from "
            << std::numeric_limits<unsigned int>::min() << " to "
            << std::numeric_limits<unsigned int>::max() << std::endl;

  std::cout << "The range for long is from " << std::numeric_limits<long>::min()
            << " to " << std::numeric_limits<long>::max() << std::endl;

  std::cout << "The range for float is from "
            << std::numeric_limits<float>::min() << " to "
            << std::numeric_limits<float>::max() << std::endl;

  std::cout << "The range(with lowest) for float is from "
            << std::numeric_limits<float>::lowest() << " to "
            << std::numeric_limits<float>::max() << std::endl;

  std::cout << "The range(with lowest) for double is from "
            << std::numeric_limits<double>::lowest() << " to "
            << std::numeric_limits<double>::max() << std::endl;

  std::cout << "The range(with lowest) for long double is from "
            << std::numeric_limits<long double>::lowest() << " to "
            << std::numeric_limits<long double>::max() << std::endl;

  // Other facilities
  // More info : https://en.cppreference.com/w/cpp/types/numeric_limits
  std::cout << "int is signed : " << std::numeric_limits<int>::is_signed
            << std::endl;
  std::cout << "int digits : " << std::numeric_limits<int>::digits << std::endl;

  return 0;
}
```




## 1.3.8 Math Functions (`<cmath>`)

The `<cmath>` header provides standard mathematical functions operating on floating-point types (`float`, `double`, `long double`).  
All functions are defined in the `std` namespace and follow IEEE-754 semantics on most modern systems.

| Function | Description | Domain | Notes |
|-----------|------------|--------|--------|
| `std::floor(x)` | Largest integer ≤ `x` | ℝ | Returns floating-point value |
| `std::ceil(x)` | Smallest integer ≥ `x` | ℝ | Returns floating-point value |
| `std::round(x)` | Rounds to nearest integer (half away from zero) | ℝ | `round(-2.5) = -3` |
| `std::abs(x)` | Absolute value | ℝ | Overloaded for integers and floating-point |
| `std::exp(x)` | Computes $e^x$ | ℝ | May overflow to `inf` |
| `std::pow(b,e)` | Computes  $b^e$ | Depends on arguments | Negative base + non-integer exponent → `NaN` |
| `std::log(x)` | Natural logarithm $\ln(x)$ | `x > 0` | Domain error if `x ≤ 0` |
| `std::log10(x)` | Base-10 logarithm | `x > 0` | Domain error if `x ≤ 0` |
| `std::sqrt(x)` | Square root | `x ≥ 0` | Negative input → `NaN` |


- Integer arguments are implicitly promoted to `double`.
- Domain violations typically produce `NaN`.
- Overflow produces `+∞` or `-∞`.
- Results are subject to floating-point rounding error.
- `<cmath>` should be preferred over `<math.h>` in modern C++.

```cpp
#include <cmath>
#include <iostream>

int main() {
  double a{7.73};
  std::cout << "a: " << a << std::endl;

  std::cout << "a rounded to floor is: "
            << std::floor(a) << std::endl;

  std::cout << "a rounded to ceil is: "
            << std::ceil(a) << std::endl;

  std::cout << std::endl;

  double b{-2412.13};
  std::cout << "b: " << b << std::endl;
  std::cout << "abs of b: "
            << std::abs(b) << std::endl;

  double e{std::exp(10)};
  std::cout << "e^10 = " << e << std::endl;

  std::cout << "3^4 = "
            << std::pow(3, 4) << std::endl;
  std::cout << "9^3 = "
            << std::pow(9, 3) << std::endl;

  std::cout << "ln(" << e << ") = "
            << std::log(e) << std::endl;

  std::cout << "log_10(10000) = "
            << std::log10(10000) << std::endl;

  std::cout << "sqrt(81) = "
            << std::sqrt(81) << std::endl;

  std::cout << "3.652 is rounded to: "
            << std::round(3.652) << std::endl;
  std::cout << "2.5 is rounded to: "
            << std::round(2.5) << std::endl;
  std::cout << "2.4 is rounded to: "
            << std::round(2.4) << std::endl;

  return 0;
}
```

## 1.3.9 Integral Promotions 

In C++, arithmetic operations on small integral types (`char`, `short`) trigger **integral promotions**.

This means that before performing arithmetic, the compiler promotes these types to at least `int`.  
This behavior is defined by the C++ standard and is not optional.


This process is called **Integral Promotion**
- `char`, `signed char`, `unsigned char`
- `short`, `unsigned short`

➡ are promoted to `int` if `int` can represent all their values.  
Otherwise, they are promoted to `unsigned int`.


```cpp
#include <iostream>

int main(){

    short int var1 {10};   // Typically 2 bytes
    short int var2 {20};   // Typically 2 bytes
    
    char var3 {40};        // 1 byte
    char var4 {50};        // 1 byte
    
    std::cout << "size of var1 : " << sizeof(var1) << std::endl;
    std::cout << "size of var2 : " << sizeof(var2) << std::endl;
    std::cout << "size of var3 : " << sizeof(var3) << std::endl;
    std::cout << "size of var4 : " << sizeof(var4) << std::endl;
    
    // Integral promotion occurs here.
    // Even though var1 and var2 are short (2 bytes),
    // they are promoted to int before addition.
    auto result1 = var1 + var2; 
    
    // Same for char: promoted to int before arithmetic.
    auto result2 = var3 + var4;
    
    std::cout << "size of result1 : " 
              << sizeof(result1) << std::endl; // Usually 4 bytes (int)
              
    std::cout << "size of result2 : " 
              << sizeof(result2) << std::endl; // Usually 4 bytes (int)
   
    return 0;
}
```


