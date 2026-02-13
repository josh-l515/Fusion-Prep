# 1.2 Variables And Data Types

## 1.2.1 System numbers:
- **Decimal (Base 10)**
  - Digits used: 0–9
  - Human-readable format, default in most code
    ```{math}
    1900 = 1 \times 10^3 + 9 \times 10^2 + 0 \times 10^1 + 0 \times 10^0
    ```
- **Binary (Base 2)**
  - Digits used: 0, 1
  - Used in low-level code and hardware
    ```{math}
    0\rm{b}\, 11100 = 0 \times 2^5 + 1 \times 2^4 + 1 \times 2^3 + 1 \times 2^2 + 0 \times 2^1 + 0 \times 2^0 = 28
    ```
- **Octal (Base 8)**
  - Digits used: 0–7
  - Used in file permissions (e.g., `chmod 755`)
    ```{math}
    0\rm{o}\,1114 = 1 \times 8^3 + 1 \times 8^2 + 1 \times 8^1 + 4 \times 8^0 = 588
    ```
- **Hexadecimal (Base 16)**
  - Digits used: 0–9, A–F (A=10, ..., F=15)
  - Used in memory addresses, web colors (e.g., `#FFAA00`)
    ```{math}
    0\rm{x}\, 1DA = 1 \times 16^2 + 13 \times 16^1 + 10 \times 16^0 = 474
    ```

The range depends on the **base** and the **number of digits (n)**.  Maximum representable value:  
```{math}
\text{Max} = \text{Base}^n - 1
```

| Number System   | Base | Digits (n) | Max Value Expression          | Range             |
|------------------|------|-------------|-----------------------------|-------------------|
| Binary           | 2    | 4           | $2^4 - 1$                   | 0 to 15           |
| Octal            | 8    | 3           | $8^3 - 1$                   | 0 to 511          |
| Decimal          | 10   | 4           | $10^4 - 1$                  | 0 to 9999         |
| Hexadecimal      | 16   | 3           | $16^3 - 1$                  | 0 to 4095         |

To assign integer values using different number systems in C++ use


```{code-block} cpp

#include <iostream>

int main() {
  int number1 = 15;         // Decimal
  int number2 = 017;        // Octal
  int number3 = 0x0f;       // Hexadecimal
  int number4 = 0b00001111; // Binary

  std::cout << "Number 1: " << number1 << std::endl;
  std::cout << "Number 2: " << number2 << std::endl;
  std::cout << "Number 3: " << number3 << std::endl;
  std::cout << "Number 4: " << number4 << std::endl;

  return 0;
}
```

## 1.2.2 Integers
  An `int` in C++ is a data type used to store **whole numbers (decimal values)**. It typically occupies **4 bytes** in memory on most systems, allowing it to store values from approximately –2,147,483,648 to 2,147,483,647 (32-bit signed integer).

> A **variable** is a named piece of memory used to store data of a specific type. In the following example, we declare four integer variables using different number systems:


```{code-block} cpp
#include <iostream>

int main() {
  // =====================Braced Initializers===================================
  int elephant_count; // Variable may contain ramdon garbages values. WARNING!
  int lion_count{};   // Initializes to 0
  int dog_count{10};  // Initializes to 10
  int cat_count{15};  // Initializes to 15
  int domesticated_animals{dog_count +
                           cat_count}; // Can use expresions as initializer

  std::cout << "Elephant count: " << elephant_count << std::endl;
  std::cout << "Lion count: " << lion_count << std::endl;
  std::cout << "Dog count: " << dog_count << std::endl;
  std::cout << "Cat count: " << cat_count << std::endl;
  std::cout << "Domesticated animals count: " << domesticated_animals
            << std::endl;
  // int narrowing_conversion{2.9}; //decimal numbers on int variables will
  // display a compile error

  // =====================Functional Initialization=============================
  int apple_count(5);
  int orange_count(10);
  int fruit_count(apple_count + orange_count);
  int narrowing_conversion_functional(2.9);

  std::cout << "Apple count: " << apple_count << std::endl;
  std::cout << "Orange count: " << orange_count << std::endl;
  std::cout << "Fruit count: " << fruit_count << std::endl;
  std::cout << "Narrowing conversion functional: "
            << narrowing_conversion_functional << std::endl;

  // =========================Assignment Notation===============================
  int bike_count = 2;
  int truck_count = 7;
  int vehicle_count = bike_count + truck_count;
  int narrowing_conversion_assignment = 2.9;

  std::cout << "Bike count: " << bike_count << std::endl;
  std::cout << "Truck count: " << truck_count << std::endl;
  std::cout << "Vehicle count: " << vehicle_count << std::endl;
  std::cout << "Narrowing conversion assignment: "
            << narrowing_conversion_assignment << std::endl;

  // =============Check the size of variables with sizeof=======================
  std::cout << "Size int: " << sizeof(int) << std::endl;
  std::cout << "Size narrowing_conversion_assignment: "
            << sizeof(narrowing_conversion_assignment) << std::endl;

  return 0;
}
```


## 1.2.3 Integers Modifiers

 In C++, you can modify the size and sign of an `int` using **type modifiers**. These modifiers help control how much memory the variable uses and what range of values it can store.

  There are two main categories of modifiers:

  - **Sign Modifiers**
    - `signed`: Allows both positive and negative values (default for `int`)
    - `unsigned`: Allows only non-negative values, doubles the upper limit

  - **Size Modifiers**
    - `short`: Uses less memory (usually 2 bytes)
    - `long`: Uses more memory (usually 4 or 8 bytes)
    - `long long`: Uses even more memory (typically 8 bytes)

```{code-block} cpp
#include <iostream>

int main() {
  int value1{10};
  int value2{-300};

  std::cout << "Value 1: " << value1 << std::endl;
  std::cout << "Value 2: " << value2 << std::endl;
  std::cout << "sizeof(value1): " << sizeof(value1) << std::endl;
  std::cout << "sizeof(value2): " << sizeof(value2) << std::endl;
  unsigned int value3{4};
  // unsigned int value4{-5}; // Compiler error.

  // short and long
  short short_var{-32768};                 //  2 Bytes
  short int short_int{455};                //
  signed short signed_short{122};          //
  signed short int signed_short_int{-456}; //
  unsigned short int unsigned_short_int{456};

  int int_var{55};           // 4 bytes
  signed signed_var{66};     //
  signed int signed_int{77}; //
  unsigned int unsigned_int{77};

  long long_var{88}; // 4 OR 8 Bytes
  long int long_int{33};
  signed long signed_long{44};
  signed long int signed_long_int{44};
  unsigned long int unsigned_long_int{44};

  long long long_long{888}; // 8 Bytes
  long long int long_long_int{999};
  signed long long signed_long_long{444};
  signed long long int signed_long_long_int{1234};
  unsigned long long int unsigned_long_long_int{1234};

  std::cout << "Short variable : " << short_var << " , size : " << sizeof(short)
            << " bytes" << std::endl;
  std::cout << "Short Int : " << short_int << " , size : " << sizeof(short int)
            << " bytes" << std::endl;
  std::cout << "Signed short : " << signed_short
            << " , size : " << sizeof(signed short) << " bytes" << std::endl;
  std::cout << "Signed short int :  " << signed_short_int
            << " , size : " << sizeof(signed short int) << " bytes"
            << std::endl;
  std::cout << "unsigned short int :  " << unsigned_short_int
            << " , size : " << sizeof(unsigned short int) << " bytes"
            << std::endl;
  std::cout << "---------------------" << std::endl;

  std::cout << "Int variable :  " << int_var << " , size : " << sizeof(int)
            << " bytes" << std::endl;
  std::cout << "Signed variable " << signed_var
            << " , size : " << sizeof(signed) << " bytes" << std::endl;
  std::cout << "Signed int :  " << signed_int
            << " , size : " << sizeof(signed int) << " bytes" << std::endl;
  std::cout << "unsigned int :  " << unsigned_int
            << " , size : " << sizeof(unsigned int) << " bytes" << std::endl;
  std::cout << "---------------------" << std::endl;

  std::cout << "Long variable :  " << long_var << " , size : " << sizeof(long)
            << " bytes" << std::endl;
  std::cout << "Long int :  " << long_int << " , size : " << sizeof(long int)
            << " bytes" << std::endl;
  std::cout << "Signed long :  " << signed_long
            << " , size : " << sizeof(signed long) << " bytes" << std::endl;
  std::cout << "Signed long int : " << signed_long_int
            << " , size : " << sizeof(signed long int) << " bytes" << std::endl;
  std::cout << "unsigned long int : " << unsigned_long_int
            << " , size : " << sizeof(unsigned long int) << " bytes"
            << std::endl;
  std::cout << "---------------------" << std::endl;

  std::cout << "Long long : " << long_long << " , size : " << sizeof(long long)
            << " bytes" << std::endl;
  std::cout << "Long long int : " << long_long_int
            << " , size : " << sizeof(long long int) << " bytes" << std::endl;
  std::cout << "Signed long long : " << signed_long_long
            << " , size : " << sizeof(signed long long) << " bytes"
            << std::endl;
  std::cout << "Signed long long int : " << signed_long_long_int
            << " , size : " << sizeof(signed long long int) << " bytes"
            << std::endl;
  std::cout << "unsigned long long int : " << unsigned_long_long_int
            << " , size : " << sizeof(unsigned long long int) << " bytes"
            << std::endl;
  std::cout << "---------------------" << std::endl;

  return 0;
}

```

| Type                      | Typical Size | Value Range                              |
|---------------------------|--------------|-------------------------------------------|
| `short`                  | 2 bytes      | –32,768 to 32,767                         |
| `unsigned short`         | 2 bytes      | 0 to 65,535                               |
| `int`                    | 4 bytes      | –2,147,483,648 to 2,147,483,647           |
| `unsigned int`           | 4 bytes      | 0 to 4,294,967,295                        |
| `long`                   | 4 or 8 bytes | platform-dependent                        |
| `unsigned long`          | 4 or 8 bytes | platform-dependent                        |
| `long long`              | 8 bytes      | ±9 quintillion (approx.)                  |
| `unsigned long long`   | 8 bytes      | 0 to 18 quintillion (approx.)             |


## 1.2.4 Fractional Numbers
  C++ provides several types to represent **real numbers** (numbers with fractional parts), known as **floating-point types**:

  | Type           | Approx. Precision | Typical Size (bytes) |
  |----------------|-------------------|-----------------------|
  | `float`        | ~7 digits         | 4                     |
  | `double`       | ~15 digits        | 8                     |
  | `long double`  | 15+ digits        | 8 or more (platform-dependent) |


By default, C++ treats decimal literals like `3.14` as `double`. Use `f` to make it `float` (`3.14f`), and `L` to make it `long double` (`3.14L`).


  ```{code-block} cpp
  #include <iomanip>   // For std::setprecision
  #include <iostream>  // For input/output

  int main() {

    // Declare and initialize floating-point variables
    float number1{1.12345678901234567890f};    // float: 7 digits precision
    double number2{1.12345678901234567890};    // double: 15 digits precision
    long double number3{1.12345678901234567890L}; // long double: platform-dependent

    // Display the sizes in bytes
    std::cout << "sizeof float : " << sizeof(float) << std::endl;
    std::cout << "sizeof double : " << sizeof(double) << std::endl;
    std::cout << "sizeof long double : " << sizeof(long double) << std::endl;

    // Set precision to 20 digits for output
    std::cout << std::setprecision(20);
    
    // Print the actual stored values (note loss of precision in float)
    std::cout << "number1 is : " << number1 << std::endl;
    std::cout << "number2 is : " << number2 << std::endl;
    std::cout << "number3 is : " << number3 << std::endl;

    // Demonstrating limitations in float precision
    float number4 = 192400023.0f; // May lose precision due to narrow range
    std::cout << "number4 : " << number4 << std::endl;

    // Scientific notation: useful for very large or small numbers
    std::cout << "-------------------------" << std::endl;

    double number5{192400023};       // Regular fixed-point notation
    double number6{1.92400023e8};    // Scientific notation (same as above)
    double number7{1.924e8};         // Shortened version
    double number8{0.00000000003498};
    double number9{3.498e-11};       // Same as above in scientific notation

    std::cout << "number5 is : " << number5 << std::endl;
    std::cout << "number6 is : " << number6 << std::endl;
    std::cout << "number7 is : " << number7 << std::endl;
    std::cout << "number8 is : " << number8 << std::endl;
    std::cout << "number9 is : " << number9 << std::endl;

    // Demonstrating special values: Infinity and NaN
    std::cout << std::endl;
    std::cout << "Infinity and NaN" << std::endl;

    double number10{-5.6};
    double number11{};  // Initialized to 0
    double number12{};  // Also 0

    // Infinity: division by zero (numerator ≠ 0)
    double result{number10 / number11};
    std::cout << number10 << "/" << number11 << " yields " << result << std::endl;
    std::cout << result << " + " << number10 << " yields " << result + number10 << std::endl;

    // NaN (Not a Number): 0 divided by 0 is undefined
    result = number11 / number12;
    std::cout << number11 << "/" << number12 << " = " << result << std::endl;

    return 0;
  } 
```

## 1.2.5 Boolean Type (`bool`)

C++ provides the `bool` type to represent **logical values**. A boolean can hold only two states:

- `true`
- `false`

Internally, `bool` is typically stored in **1 byte (8 bits)**, although the C++ standard only guarantees that it can represent `true` and `false` (the exact size is implementation-defined).

Booleans are commonly used in:
- Conditions (`if`, `while`, `for`)
- Flags (on/off, enabled/disabled, valid/invalid)
- Logical expressions and comparisons

**Key Points**

- You can compare explicitly: `if (red_light == true)`
- Prefer using the value directly: `if (red_light)`
- When printed with `std::cout`, booleans show:
  - `0` for `false`
  - `1` for `true`
- Using `std::boolalpha` makes the output **human-readable**: `true` / `false`

```{code-block} cpp
#include <iostream>

// Boolean values typically occupy 1 byte (8 bits) in memory

int main() {
  // Declare and initialize boolean variables
  bool red_light{true};
  bool green_light{false};

  // Explicit comparison with true (works, but is usually unnecessary)
  if (red_light == true) {
    std::cout << "Stop!" << std::endl;
  } else {
    std::cout << "Go through!" << std::endl;
  }

  // Preferred style: use the boolean directly in the condition
  if (red_light) {
    std::cout << "The light is RED" << std::endl;
  } else {
    std::cout << "The light is GREEN" << std::endl;
  }

  // Check how much memory a boolean uses
  std::cout << "sizeof(bool): " << sizeof(bool) << " byte(s)" << std::endl;

  // By default, booleans are printed as integers:
  // false -> 0, true -> 1
  std::cout << std::endl;
  std::cout << "Default output:" << std::endl;
  std::cout << "red_light: " << red_light << std::endl;
  std::cout << "green_light: " << green_light << std::endl;

  // Make boolean output more readable
  std::cout << std::boolalpha;
  std::cout << std::endl;
  std::cout << "With std::boolalpha:" << std::endl;
  std::cout << "red_light: " << red_light << std::endl;
  std::cout << "green_light: " << green_light << std::endl;

  return 0;
}

