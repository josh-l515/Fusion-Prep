#  1.1 Getting started

## 1.1.1 Printing on console

Print several messages to the terminal using `std::cout`.  
The `#include <iostream>` directive is required to use input/output streams like `std::cout`.

```{code-block} cpp
#include <iostream>

int main() {
  std::cout << "Hello World!" << std::endl;
  std::cout << "Hello Arh Linux" << std::endl;
  std::cout << "Hello dwm" << std::endl;
  std::cout << "Hello Josh" << std::endl;
  std::cout << "Hello David" << std::endl;
  return 0;
}
```
Use the following commands in your terminal  `$ g++ -o main main.cpp` to compile, and `$ ./main` to excute the main file, the output is shown below

```{code-block} console
$ ./main
Hello World!
Hello Arh Linux
Hello dwm
Hello Josh
Hello David
```

## 1.1.2 Commenting in C++

Use both single-line (`//`) and multi-line (`/* ... */`) comments to document code.  
Prints comment syntax explanations to the terminal.

```{code-block} cpp
// This brings in the iostream library
#include <iostream>

/*
  This is a block comment that englonbes multiple
  line of text
*/

int main() {
  // This is going to print "Hello World" into the terminal
  std::cout << "This is a comment script written on c++ 23 " << std::endl;
  std::cout << "You may wanna see the code, not just the binary" << std::endl;
  std::cout << "=============*/THEORY*/==================" << std::endl;
  std::cout << "//Comments out a single line" << std::endl;
  std::cout << "/*...*/ Block Comments out a block of text" << std::endl;
  std::cout << "Block comments can't be nested" << std::endl;
  std::cout << "Use comments to document your code. Don't overdo it though"
            << std::endl;
  return 0;
}
```


## 1.1.3 Errors and Warnings in C++
There are three kinds of errors that you may encounter while  programming in cpp
1. **Compile-time errors**
Detected when you compile the code.  

    - **Examples**: missing semicolon, syntax errors, undeclared variables.

2. **Runtime errors**
Happen while the program is running.  

    - **Examples**: division by zero, invalid memory access.

3. **Warnings**
Not critical — the program compiles, but something might go wrong.  

    - **Examples**: unused variables, signed/unsigned comparisons.

Use `-Wall` to enable warnings:

```{code-block} console
$ g++ -Wall -o program program.cpp
```
## 1.1.4 Statements and Functions

- A **statement** is a single line of instruction that ends with a semicolon `;`.  
  It can declare a variable, assign a value, call a function, or print to the console.

- A **function** is a block of code that performs a specific task.  
  It can receive inputs (parameters) and return a result.

```{code-block} cpp
#include <iostream>

// This function adds two numbers and returns the result
int Add(int a, int b) {
  return a + b; // This is a statement
}

int main() {
  int x = 10;                         // Statement: declare and assign
  int y = 5;                          // Statement
  int sum = Add(x, y);               // Statement: function call
  std::cout << "Sum: " << sum << std::endl;  // Statement: output
  return 0;                           // Statement
}
```


The next example declares and call a function that adds add two numbers. Also demonstrates how each statement performs one task, such as declaring a variable or calling a function.

```{code-block} cpp
#include <iostream>

int AddNumbers(int first_param, int second_param) {
  int result = first_param + second_param;
  return result;
}

// An statement is the basic unit i c++, consider it as a code line, so when
// one compiles a c++ script, it goes from the first line (Statement 1), to the
// last one, that is supossed to be the last Statement.

int main() {

  // With Statements
  int first_number{5};   // Statement 1
  int second_number{15}; // Statement 2

  std::cout << "First Number: " << first_number << std::endl;
  std::cout << "Second Number: " << second_number << std::endl;

  int sum = first_number + second_number;

  std::cout << "Sum: " << sum << std::endl;

  // With the function AddNumbers
  sum = AddNumbers(14, 26);
  std::cout << "Sum using functions: " << sum << std::endl;
  std::cout << "Sum using functions: " << AddNumbers(17, 23) << std::endl;

  return 0;
}
```

## 1.1.5 Input and Output Streams

- Use `std::cout` to print normal messages.
- Use `std::cerr` for error messages.
- Use `std::clog` for log/debug messages.
- Use `std::cin` to get user input.
- Use `std::getline` to read full lines, including spaces.

```{code-block} cpp
#include <iostream>
#include <string>

int main() {
  // Print data
  int age{23};
  std::cout << "Age: " << age << std::endl;

  std::cerr << "Error Message: Something gone wrong" << std::endl;
  std::clog << "Log Message: Something happened" << std::endl;

  // Requesting data
  int age1;
  std::string name;
  std::cout << "Hello, please type your name and your age" << std::endl;
  std::cin >> name >> age1;
  std::cout << "Your name is: " << name << " you are " << age1 << " years old"
            << std::endl;

  // Data with spaces
  std::string fullname;
  int age2;
  std::cout << "Hi again, please now type your fullname and age: " << std::endl;
  std::getline(std::cin, fullname);
  std::cin >> age2;
  std::cout << "Your fullname is: " << fullname << " you are " << age2
            << std::endl;

  return 0;
}

