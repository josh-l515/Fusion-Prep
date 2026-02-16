
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
