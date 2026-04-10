# 1.9 Functions
## 1.9.1 Functions, Parameters, and Return Values
A function is a reusable block of code that:
- May take **inputs (parameters)**
- May return a **result**

---

### Function with Parameters (No Return)

```{code-block} cpp
void enter_bar(size_t age){
    if(age > 18){
        std::cout << "You're " << age << " years old. Please proceed." << std::endl;
    }else{
        std::cout << "Sorry, you're too young for this." << std::endl;
    }
}
```

- Takes one parameter: `age`
- Returns nothing (`void`)

---

### Function with Parameters and Return Value

```{code-block} cpp
int max(int a, int b){
    if(a > b)
        return a;
    else
        return b;
}
```

- Takes two parameters
- Returns the larger value

---

### Function with No Parameters and No Return

```{code-block} cpp
void say_hello(){
    std::cout << "Hello there" << std::endl;
}
```

- No parameters
- No return value

---

### Function with No Parameters but Returns Value

```{code-block} cpp
int lucky_number(){
    return 99;
}
```

---


### Function Calls and Arguments

```{code-block} cpp
enter_bar(22);
enter_bar(15);
```

- Values passed are called **arguments**
- Parameters receive copies of these values

---

### Using Functions in Expressions

```{code-block} cpp
int result = max(100, 20);
```

- Function return values can be assigned or used directly

---

### Variable Scope

Variables declared inside functions:
- Exist only within that function
- Are destroyed when the function ends

```{code-block} cpp
double result = ((++a) * (++b));
```

- `result` is local to the function

```{code-block} cpp
int result{};
result = lucky_number();
```

- Reusing variable names is allowed
- But can lead to confusion in larger programs

---

```{code-block} cpp

#include <iostream>

// Function that takes a single parameter, and doesn't
// give back the result explicitly
void enter_bar(size_t age) { // Functions parameters
  if (age > 18) {
    std::cout << "You're " << age << " years old. Please proceed." << std::endl;
  } else {
    std::cout << "Sorry, you're too young for this. No offense! " << std::endl;
  }
  return;
}

// Function that takes multiple parameters and returns the result of the
// computation
int max(int a, int b) {
  if (a > b)
    return a;
  else
    return b;
}

// Function that doesnt' take parameters and returns nothing
void say_hello() {
  std::cout << "Hello there" << std::endl;
  return; // You could omit this return statement for functions returning void
}

// Function that takes no parameters and return something
int lucky_number() { return 99; }

// Parameters passed this way are scoped localy in the function.
// Changes to them are not visible outside the function. What we
// have inside the function are actually COPIES of the arguments
// passed to the function.
double increment_multiply(double a, double b) {

  std::cout << "Inside function , before increment : " << std::endl;
  std::cout << "a : " << a << std::endl;
  std::cout << "b : " << b << std::endl;

  double result = ((++a) * (++b));

  std::cout << "Inside function , after increment : " << std::endl;
  std::cout << "a : " << a << std::endl;
  std::cout << "b : " << b << std::endl;

  // Returning the result
  return result;
}

int main() {
  // Calling enter_bar

  enter_bar(22); // Function arguments
  enter_bar(15);

  for (size_t i{1}; i < 20; ++i) {
    enter_bar(i);
  }

  // Calling max

  int x{22};
  int y{44};
  int result = max(100, 20); // Arguments
  result = max(x, y);
  std::cout << "max : " << result << std::endl;

  // Calling say_hello

  say_hello();

  // Calling lucy_number

  int result{};
  result = lucky_number();
  std::cout << "result : " << result << std::endl;

  double h{3.00};
  double i{4.00};

  std::cout << "Outside function , before increment : " << std::endl;
  std::cout << "h : " << h << std::endl;
  std::cout << "i : " << i << std::endl;

  double incr_mult_result = increment_multiply(h, i);

  std::cout << "Outside function , before increment : " << std::endl;
  std::cout << "h : " << h << std::endl;
  std::cout << "i : " << i << std::endl;

  return 0;
}
```

## 1.9.2 Function Declaration and Definition

In C++, a function is typically introduced in two steps:

1. **Declaration (prototype)** → tells the compiler that the function exists  
2. **Definition** → provides the actual implementation  

This separation is fundamental and becomes essential when working with **multiple files (.h and .cpp)**.

---

### Function Declaration (Prototype)

```{code-block} cpp
int max(int a, int b);
int min(int a, int b);
int inc_mult(int a, int b);
```

A **function declaration** (or prototype):

- Introduces the function to the compiler
- Specifies:
  - Function name
  - Parameter types
  - Return type
- Does **NOT** include the function body

Its purpose is to allow the function to be **used before it is defined**.

---

### Why Declarations Are Needed

C++ is compiled **top to bottom**.

```{code-block} cpp
int main(){
    int result = min(5,10); // compiler must already know min
}
```

If the compiler has not seen a declaration of `min` before this point:

- It does not know:
  - What `min` is
  - What parameters it expects
  - What it returns  
- This results in a **compilation error**

---

### Function Definition

```{code-block} cpp
int min(int a, int b){
    if(a < b)
        return a;
    else
        return b;
}
```

A **function definition**:

- Provides the **actual implementation**
- Contains the function body `{ ... }`
- Must match the declaration exactly

---

### Using Declaration + Definition Together

```{code-block} cpp
int min(int a, int b); // declaration

int main(){
    int result = min(5,10); // valid
}

int min(int a, int b){ // definition (after main)
    return (a < b) ? a : b;
}
```


- Declaration allows usage
- Definition provides behavior

---
### Signature

The **function signature** consists of:

- Function name  
- Parameter types  

Example:

```{code-block} cpp
int max(int a, int b);
```

Signature:
- `max(int, int)`

Important:
- The **return type is NOT part of the signature**


```{code-block} cpp

#include <iostream>

int max(int a, int b); // Function declaration , prototype
                       // Signature doesn't include return type
int min(int a, int b);

int inc_mult(int a, int b);

int main() {

  int x{5};
  int y{12};

  int result = min(x, y);
  std::cout << "min : " << result << std::endl;

  result = inc_mult(x, y);
  std::cout << "result : " << result << std::endl;

  return 0;
}

// Function definition. Shows up after main
int max(int a, int b) {
  if (a > b)
    return a;
  else
    return b;
}

// Function definition. Shows up after main
int min(int a, int b) {
  if (a < b)
    return a;
  else
    return b;
}

int inc_mult(int a, int b) { return ((++a) * (++b)); }

```


## 1.9.3 Multiple Files Compilation Model

As programs grow, it is necessary to organize code into **multiple files**. C++ achieves this through a separation between:

- **Declarations** → placed in header files (`.h`)
- **Definitions** → placed in source files (`.cpp`)

This is known as the **multiple files compilation model**.

---

### Using Header Files in `main.cpp`

```{code-block} cpp
#include <iostream>
#include "compare.h"
#include "operations.h"

int main(){

    int maximum = max(134,56);
    std::cout << "max : " << maximum << std::endl;

    int minimum = min(146,23);
    std::cout << "min : " << minimum << std::endl;

    int x{4};
    int y{5};

    int result = incr_mult(x,y);
    std::cout << "result : " << result << std::endl;
   
    return 0;
}
```

- `#include "compare.h"` and `#include "operations.h"`  
  make function **declarations visible** to this file

---

### What `#include` Does

The preprocessor replaces:

```{code-block} cpp
#include "compare.h"
```

with the **contents of the file** `compare.h`.

Conceptually:

```{code-block} cpp
// contents of compare.h inserted here
```

This happens **before compilation**.

---

### Header Files (`.h`)

Contain **declarations only**:

```{code-block} cpp
// compare.h
int max(int a, int b);
int min(int a, int b);
```

```{code-block} cpp
// operations.h
int incr_mult(int a, int b);
```

Rules:
- No function bodies (in most cases)
- Serve as the **interface**

---

### Source Files (`.cpp`)

Contain **definitions (implementations)**:

```{code-block} cpp
// compare.cpp
int max(int a, int b){
    return (a > b) ? a : b;
}

int min(int a, int b){
    return (a < b) ? a : b;
}
```

```{code-block} cpp
// operations.cpp
int incr_mult(int a, int b){
    return ((++a) * (++b));
}
```

---

### Compilation Model

Each `.cpp` file is compiled **independently**:

```text
g++ main.cpp compare.cpp operations.cpp -o app
```

Steps:

1. Preprocessor handles `#include`
2. Each `.cpp` becomes a **translation unit**
3. Compiler generates object files
4. Linker combines them into final executable

Definitions must exist at link time

If `compare.cpp` is missing during compilation:

```text
undefined reference to `max(int,int)`
```

This is a **linker error**, not a compiler error.

## 1.9.4 Pass by Value

In C++, the default way of passing arguments to functions is **pass by value**. When a variable is passed by value, the function receives a copy of the original value.

Any modification made inside the function affects only the copy, not the original variable.

**Syntax**
```{code-block} cpp
void function_name(type parameter);
```

- The parameter is a separate local variable inside the function.
- The value of the argument is copied into the parameter.
- Changes made to the parameter do not affect the original variable.
- The parameter and the original variable have different memory addresses.

```{code-block} cpp
int age{23};

say_age(age);
```

In this example, the value `23` is copied into the function parameter.

```{code-block} cpp
void say_age(int age)
```

Inside the function, `age` is a new local variable that exists only during the function call.

```{code-block} cpp
++age;
```

This increments only the local copy. The original variable in `main` is unchanged.

If `age` in `main` is `23`, the function prints `24`, but after the function call the original variable is still `23`.

The parameter and the original variable occupy different locations in memory:

```{code-block} cpp
std::cout << &age << std::endl;
```

- In `main`, `&age` is the address of the original variable.
- In `say_age`, `&age` is the address of the copied parameter.

The following example shows this behavior:

```{code-block} cpp
#include <iostream>

void say_age(int age){ // Parameter (copy)
    ++age;
    std::cout <<  "Hello , you are " << age 
              << " years old! &age : " << &age << std::endl;
}

int main(){

    int age{23}; // original variable

    std::cout << "age (before call) : " << age 
              << " &age : " << &age << std::endl;

    say_age(age); // argument (value is copied)

    std::cout << "age (after call) : " << age 
              << " &age : " << &age << std::endl;

    return 0;
}
```

Typical output:

```{code-block} text
age (before call) : 23 &age : 0x61ff08
Hello, you are 24 years old! &age : 0x61fefc
age (after call) : 23 &age : 0x61ff08
```

The address inside the function is different because the parameter is a copy stored in a different memory location.

The original variable keeps its initial value after the function call.

## 1.9.5 Pass by Pointer

A pointer can be passed to a function so that the function can access and modify the original variable.

When a pointer is passed as an argument, the function receives the memory address of the variable instead of a copy of its value.

**Syntax**
```{code-block} cpp
void function_name(type* parameter);
```

- The parameter is a pointer.
- The argument passed to the function must be an address.
- The address of a variable is obtained with the `&` operator.
- The original variable can be modified inside the function through dereferencing.

```{code-block} cpp
int age{23};

say_age(&age);
```

In this example, `&age` passes the address of `age` to the function.

Inside the function, the pointer parameter stores that address:

```{code-block} cpp
void say_age(int* age)
```

To access or modify the original value, the pointer must be dereferenced with `*`:

```{code-block} cpp
++(*age);
```

This statement increments the value stored at the address pointed to by `age`.

If `age` originally contains `23`, after the increment it becomes `24`.

The pointer parameter itself is a local variable inside the function. Therefore, `&age` inside the function is different from `&age` in `main`.

```{code-block} cpp
std::cout << &age << std::endl;
```

- In `main`, `&age` is the address of the integer variable.
- In `say_age`, `&age` is the address of the pointer parameter.

The following example shows this behavior:

```{code-block} cpp
#include <iostream>

void say_age(int* age); // Declaration

int main(){

    int age{23}; // Local
    std::cout << "age (before call) : " << age << "&age : " << &age << std::endl; //23
    say_age(&age); // Argument
    std::cout << "age (after call) : " << age << "&age : " << &age <<  std::endl; //24

    return 0;
}


void say_age(int* age){ // Parameter
    ++(*age); 
    std::cout <<  "Hello , you are " << *age << " years old! &age : " << &age <<  std::endl;//24
}
```

Typical output:

```{code-block} text
age (before call) : 23 &age : 0x61ff08
Hello, you are 24 years old! &age : 0x61fef8
age (after call) : 24 &age : 0x61ff08
```

The address printed in `main` remains the same before and after the call because the same variable is being modified.

The address printed inside `say_age` is different because it is the address of the local pointer parameter.

## 1.9.6 Pass by Reference

When a variable is passed by reference, the function parameter becomes an alias for the original variable.

No copy is created. The function works directly with the original object.

**Syntax**
```{code-block} cpp
void function_name(type& parameter);
```

- The parameter is a reference to the original variable.
- No copy of the argument is made.
- Any modification to the parameter changes the original variable.
- The parameter and the original variable share the same memory address.

```{code-block} cpp
int age{23};

say_age(age);
```

In this example, `age` is passed directly to the function.

```{code-block} cpp
void say_age(int& age)
```

Inside the function, `age` is not a new variable. It is another name for the variable declared in `main`.

```{code-block} cpp
++age;
```

This increments the original variable.

If `age` in `main` is `23`, after the function call it becomes `24`.

Because the parameter is a reference, both `age` inside `main` and `age` inside the function have the same address:

```{code-block} cpp
std::cout << &age << std::endl;
```

- In `main`, `&age` is the address of the original variable.
- In `say_age`, `&age` is exactly the same address.

The following example shows this behavior:

```{code-block} cpp
#include <iostream>

void say_age(int& age); // Declaration

int main(){

    int age{23}; // Local
    std::cout << "age (before call) : " << age << "&age : " << &age << std::endl; //23
    say_age(age); // Argument
    std::cout << "age (after call) : " << age << "&age : " << &age <<  std::endl; //24

    return 0;
}


void say_age(int& age){ // Parameter
    ++age; 
    std::cout <<  "Hello , you are " << age << " years old! &age : " << &age <<  std::endl;//24

}
```

Typical output:

```{code-block} text
age (before call) : 23 &age : 0x61ff08
Hello, you are 24 years old! &age : 0x61ff08
age (after call) : 24 &age : 0x61ff08
```

The address is the same in all three lines because the function parameter refers to the same variable declared in `main`.
