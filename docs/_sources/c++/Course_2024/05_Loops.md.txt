# 1.5 Loops


## 1.5.1 For Loop

The `for` loop is commonly used when the number of iterations is **known in advance**.  
It combines **initialization**, **condition**, and **iteration step** in a single construct.

```{code-block} cpp 
for (initialization; condition; increment)
{
// loop body
}
```



Execution order:

1. The **initialization** statement runs once.
2. The **condition** is evaluated before each iteration.
3. If the condition is `true`, the loop body executes.
4. The **increment/decrement expression** runs after each iteration.
5. The loop stops when the condition becomes `false`.

**Notes**

- The loop variable is often called the **iterator**.
- The iterator can be declared **inside or outside** the loop.
- If declared inside the loop, its **scope is limited to the loop body**.
- `size_t` is commonly used for counters when working with **sizes or indices**.
- Parts of the `for` statement can be **left empty** if handled elsewhere.
- Using a **named constant** (e.g., `COUNT`) improves readability and maintainability.

**About `size_t`**

`size_t` is an **unsigned integer type** defined in `<cstddef>`.  
It is typically used to represent **sizes, array indices, and counts**, and its size depends on the system architecture.


```{code-block} cpp
#include <cstddef>
#include <iostream>

int main() {

  // Basic for loop with an unsigned integer iterator
  for (unsigned int i{0}; i < 10; ++i) {
    std::cout << i << " :I love C++" << std::endl;
  }
  std::cout << "loop done" << std::endl;

  // size_t is commonly used for sizes and indices
  std::cout << "size of size_t: " << sizeof(size_t) << std::endl;

  for (size_t i{0}; i < 10; ++i) {
    std::cout << i << " :I love C++" << std::endl;
  }
  std::cout << "loop done" << std::endl;

  // Scope example:
  // i declared inside the loop is not accessible here
  // std::cout << "i: " << i << std::endl; // Compiler error

  // Iterator declared outside the loop
  size_t i{0};
  for (i; i < 10; ++i) {
    std::cout << i << " :I love C++" << std::endl;
  }
  std::cout << "loop done" << std::endl;
  std::cout << "i: " << i << std::endl; // i = 10

  // Initialization can be omitted if the iterator already exists
  size_t j{0};
  for (; j < 10; ++j) {
    std::cout << j << " :I love C++" << std::endl;
  }
  std::cout << "loop done" << std::endl;
  std::cout << "j: " << j << std::endl; // j = 10

  // Better practice: use a named constant for loop limits
  const size_t COUNT{10};
  size_t k{0};

  for (k; k < COUNT; ++k) {
    std::cout << k << " :I love C++" << std::endl;
  }

  std::cout << "loop done" << std::endl;
  std::cout << "k: " << k << std::endl; // k = 10

  return 0;
}
```


## 1.5.2 While Loop

The `while` loop repeatedly executes a block of code **as long as a condition remains true**.  
It is typically used when the **number of iterations is not known in advance**.

Unlike the `for` loop, the initialization and update of the loop variable are usually handled **outside the loop structure**, which provides more flexibility.


``` {code-block} cpp 
while(condition)
{
// loop body
}
``` 


Execution order:

1. The **condition is evaluated** before each iteration.
2. If the condition is `true`, the loop body executes.
3. The loop continues until the condition becomes `false`.

**Notes**

- The loop condition is evaluated **before each iteration**.
- If the condition is **false from the start**, the loop body **will not execute**.
- The loop variable must usually be **updated manually** inside the loop.
- Failure to update the loop variable may result in an **infinite loop**.
- By convention, **constant variables are written in uppercase** to improve readability.
- `size_t` is commonly used for **counters and sizes** because it represents unsigned values.


```{code-block} cpp
#include <cstddef>
#include <iostream>

int main() {

  // Convention: constant variables are often written in uppercase
  const size_t COUNT{10};

  // Loop counter
  size_t i{0};

  // Loop runs while the condition remains true
  while (i < COUNT) {
    std::cout << i << " : I love C++" << std::endl;

    // Important: update the iterator to avoid an infinite loop
    ++i;
  }

  std::cout << "while loop done" << std::endl;

  // i is still accessible here because it was declared outside the loop
  std::cout << "i: " << i << std::endl;

  return 0;
}
```

## 1.5.3 Do-While Loop

The `do-while` loop is similar to the `while` loop, but the **condition is evaluated after the loop body executes**.  
This guarantees that the loop body **runs at least once**, even if the condition is initially false.

**Syntax**
```{code-block} cpp 
do
{
// loop body
}
while(condition);
```


- The **loop body executes first**, then the condition is evaluated.
- The loop **always runs at least once**.
- Useful when the program must **perform an action before checking the condition**.
- Common in **menu systems, input validation, or interactive programs**.
- The terminating semicolon `;` after `while(condition)` is **required**.



```{code-block} cpp
#include <cstddef>
#include <iostream>

int main() {

  const size_t COUNT{10};
  size_t i{0};

  // Loop executes first, condition checked afterwards
  do {
    std::cout << i << " : I love C++" << std::endl;

    // Update loop counter
    ++i;

  } while (i < COUNT);

  std::cout << "Loop Done" << std::endl;

  return 0;
}
