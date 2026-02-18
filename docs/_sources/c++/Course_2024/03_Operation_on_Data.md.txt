
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

