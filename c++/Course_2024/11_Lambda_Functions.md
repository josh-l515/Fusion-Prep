# 1.11 Lambda Functions


## 1.11.1 Declaring And Using Lambda Functions

Lambda functions are anonymous functions that can be declared directly where they are needed. They are useful for short operations without creating a separate named function.

The general syntax of a lambda function is:
```{code-block} cpp

[capture list] (parameters) -> return_type {

    // Function body

};

```
- `[]` is the capture list.
- `(parameters)` contains the lambda parameters.
- `-> return_type` is optional.
- If no return type is specified, the compiler deduces it automatically.
- A lambda can be stored in a variable or called immediately.

A lambda with no parameters and no return value:
```{code-block} cpp

auto func = []() {

    std::cout << "Hello World!" << std::endl;

};

func();

```

The lambda is assigned to `func` and can be called multiple times.
A lambda can also be declared and called immediately:

```{code-block} cpp

[]() {

    std::cout << "Hello World!" << std::endl;

}();

```

This form is useful when the lambda is only needed once.
Lambda functions may receive parameters:

```{code-block} cpp

[](double a, double b) {

    std::cout << "a + b : " << (a + b) << std::endl;

}(10.0, 50.0);

```
- Parameters are written inside `()`.
- Arguments are passed after the lambda definition.
- The lambda above prints the sum of `a` and `b`.
A lambda may also be stored and reused:

```{code-block} cpp

auto func1 = [](double a, double b) {

    std::cout << "a + b : " << (a + b) << std::endl;

};

func1(10, 20);

func1(5, 7);

```
Lambda functions may return values:
```{code-block} cpp

auto func11 = [](double a, double b) {

    return a + b;

};

```

The return type is automatically deduced as `double` because both operands are `double`.

The lambda can be called and the returned value stored:

```{code-block} cpp

auto result1 = func11(23, 7);

auto result2 = func11(9, 45);

```

A lambda returning a value may also be called directly inside an expression:
```{code-block} cpp

std::cout << "result : "

          << [](double a, double b) {

                 return a + b;

             }(10, 60)

          << std::endl;

```

The return type can be specified explicitly:
```{code-block} cpp

auto func3 = [](double a, double b) -> int {

    return a + b;

};

```
- `func3` explicitly returns `int`.
- The result of `a + b` is converted from `double` to `int`.
- The fractional part is discarded.

Example:
```{code-block} cpp

double a{6.9};

double b{3.5};



auto result3 = func3(a, b);

```

`result3` becomes `10`, not `10.4`.
If the return type is not specified:

```{code-block} cpp

auto func4 = [](double a, double b) {

    return a + b;

};

```

The compiler deduces the return type as `double`.
- `result3` has type `int`, usually 4 bytes.
- `result4` has type `double`, usually 8 bytes.

Complete example:

```{code-block} cpp

#include <iostream>

int main() {
  /*
  Lambda function signature :
                              [capture list] (parameters) ->return type{
                                      // Function body
                              }
  */

  // Declaring a lambda function and calling it through a name

  auto func = []() { std::cout << "Hello World!" << std::endl; };
  func();
  func();

  // Declare a lambda function and call it directly

  []() { std::cout << "Hello World!" << std::endl; }();

  // Lambda function that takes parameters

  [](double a, double b) {
    std::cout << "a + b : " << (a + b) << std::endl;
  }(10.0, 50.0);

  auto func1 = [](double a, double b) {
    std::cout << "a + b : " << (a + b) << std::endl;
  };

  func1(10, 20);
  func1(5, 7);

  // Lambda function that returns something

  auto result = [](double a, double b) { return a + b; }(10, 60);

  // std::cout << "result : " << result << std::endl;
  std::cout << "result : " << [](double a, double b) { return a + b; }(10, 60)
            << std::endl;

  auto func11 = [](double a, double b) { return a + b; };

  auto result1 = func11(23, 7);
  auto result2 = func11(9, 45);

  std::cout << "result1 : " << result1 << std::endl;
  std::cout << "result2 : " << result2 << std::endl;
  std::cout << "direct call : " << func11(5, 2) << std::endl;

  // Explicitly specify the return type
  auto func3 = [](double a, double b) -> int { return a + b; };

  auto func4 = [](double a, double b) { return a + b; };

  double a{6.9};
  double b{3.5};

  auto result3 = func3(a, b);
  auto result4 = func4(a, b);

  std::cout << "result3 : " << result3 << std::endl;
  std::cout << "result4 : " << result4 << std::endl;
  std::cout << "sizeof(result3) : " << sizeof(result3) << std::endl; // 4
  std::cout << "sizeof(result4) : " << sizeof(result4) << std::endl; // 8

  std::cout << "Done!" << std::endl;

  return 0;
}
```

## 1.11.2 Lambda Capture Lists

Lambda functions may access variables declared outside their body through a capture list.

The capture list is written between `[]` and specifies which external variables the lambda can use.

General syntax:

```{code-block} cpp

[captured_variables] () {

    // Function body

};

```
Example:

```{code-block} cpp

double a{10};

double b{20};

auto func = [a, b]() {

    std::cout << "a + b : " << a + b << std::endl;

};

func();

```



- `a` and `b` are captured by value.
- The lambda receives copies of these variables.
- The original variables outside the lambda are not modified.



Capturing by value:

```{code-block} cpp

int c{42};

auto func1 = [c]() {

    std::cout << "Inner value : " << c

              << " &inner : " << &c << std::endl;

};

```

When a variable is captured by value:

- The lambda stores its own copy of the variable.
- Changes to the original variable do not affect the copy inside the lambda.
- The address inside the lambda is different from the address outside.

Example:

```{code-block} cpp

for (size_t i{}; i < 5; ++i) {

    std::cout << "Outer value : " << c

              << " &outer : " << &c << std::endl;

    func1();

    ++c;

}

```

Typical output:
```{code-block} text


Outer value : 42 &outer : 0x7fff1e40bcbc
Inner value : 42 &inner : 0x7fff1e40bcc0
Outer value : 43 &outer : 0x7fff1e40bcbc
Inner value : 42 &inner : 0x7fff1e40bcc0
Outer value : 44 &outer : 0x7fff1e40bcbc
Inner value : 42 &inner : 0x7fff1e40bcc0
Outer value : 45 &outer : 0x7fff1e40bcbc
Inner value : 42 &inner : 0x7fff1e40bcc0
Outer value : 46 &outer : 0x7fff1e40bcbc
Inner value : 42 &inner : 0x7fff1e40bcc0


```

The outer value changes because `c` is incremented after each iteration, but the lambda always prints `42` because it captured the original value.

Variables may also be captured by reference:

```{code-block} cpp

int d{42};

auto func2 = [&d]() {

    std::cout << "Inner value : " << d

              << " &inner : " << &d << std::endl;

};

```
- `&d` means that `d` is captured by reference.
- The lambda uses the original variable instead of making a copy.
- The address inside and outside the lambda is the same.

Example:

```{code-block} cpp

for (size_t i{}; i < 5; ++i) {

    std::cout << "Outer value : " << d

              << " &outer : " << &d << std::endl;

    func2();

    ++d;

}

```

Typical output:
```{code-block} text


Outer value : 42 &outer : 0x7fff1e40bcc4
Inner value : 42 &inner : 0x7fff1e40bcc4
Outer value : 43 &outer : 0x7fff1e40bcc4
Inner value : 43 &inner : 0x7fff1e40bcc4
Outer value : 44 &outer : 0x7fff1e40bcc4
Inner value : 44 &inner : 0x7fff1e40bcc4
Outer value : 45 &outer : 0x7fff1e40bcc4
Inner value : 45 &inner : 0x7fff1e40bcc4
Outer value : 46 &outer : 0x7fff1e40bcc4
Inner value : 46 &inner : 0x7fff1e40bcc4


```

Because the lambda references the original variable, every modification to `d` is immediately visible inside the lambda.

- Capture by value uses a copy of the variable.
- Capture by reference uses the original variable.
- Use capture by value when the lambda should preserve the original state.
- Use capture by reference when the lambda must observe or modify the external variable.

Complete example:

```{code-block} cpp

#include <iostream>

int main() {

  // Capture lists

  double a{10};
  double b{20};

  auto func = [a, b]() { std::cout << "a + b : " << a + b << std::endl; };
  func();

  // Capturing by value

  int c{42};

  auto func1 = [c]() {
    std::cout << "Inner value : " << c << " &inner : " << &c << std::endl;
  };

  for (size_t i{}; i < 5; ++i) {
    std::cout << "Outer value : " << c << " &outer : " << &c << std::endl;
    func1();
    ++c;
  }

  // Capture by referenc
  std::cout << std::endl;
  int d{42};

  auto func2 = [&d]() {
    std::cout << "Inner value : " << d << " &inner : " << &d << std::endl;
  };

  for (size_t i{}; i < 5; ++i) {
    std::cout << "Outer value : " << d << " &outer : " << &d << std::endl;
    func2();
    ++d;
  }

  return 0;
}
``` 



## 1.12.3 Capture all Lists

Instead of listing each variable explicitly in the capture list, a lambda may capture all accessible variables automatically.

The default capture mode is specified inside `[]`.

### Capture everything by value:

```{code-block} cpp

[=] () {

    // Function body

};

```
- `[=]` captures all external variables used inside the lambda by value.
- Each variable is copied into the lambda.
- Changes to the original variables are not visible inside the lambda.

Example:
```{code-block} cpp

int a{42};

auto func = [=]() {

    std::cout << "Inner value : " << a << std::endl;

};

```

The lambda stores a copy of `a` when it is created.

```{code-block} cpp

for (size_t i{}; i < 5; ++i) {

    std::cout << "Outer value : " << a << std::endl;

    func();

    ++a;

}

```
Typical output:
```{code-block} text

Outer value : 42
Inner value : 42

Outer value : 43
Inner value : 42

Outer value : 44
Inner value : 42

```

Although `a` changes in the loop, the lambda always prints `42` because it uses its internal copy.

### Capture everything by reference:
```{code-block} cpp

[&] () {

    // Function body

};

```
- `[&]` captures all external variables used inside the lambda by reference.
- The lambda accesses the original variables directly.
- Any change made outside the lambda is visible inside it.

Example:
```{code-block} cpp

int c{42};
int d{5};

auto func1 = [&]() {

    std::cout << "Inner value : " << c << std::endl;
    std::cout << "Inner value(d) : " << d << std::endl;

};

```
The lambda uses the original variables `c` and `d`.
```{code-block} cpp

for (size_t i{}; i < 5; ++i) {

    std::cout << "Outer value : " << c << std::endl;

    func1();

    ++c;

}

```
Typical output:

```{code-block} text

Outer value : 42
Inner value : 42
Inner value(d) : 5

Outer value : 43
Inner value : 43
Inner value(d) : 5

Outer value : 44
Inner value : 44
Inner value(d) : 5

```
Because `c` is captured by reference, the lambda sees its updated value each time the loop runs.

`d` is also captured by reference, but since it is never modified, it always remains `5`.

- `[=]` captures all used variables by value.
- `[&]` captures all used variables by reference.
- Use `[=]` when the lambda should preserve the original values.
- Use `[&]` when the lambda must observe or modify external variables.
- Explicit captures such as `[a, &b]` are usually preferred in larger programs because they make the code clearer.

Complete example:
```{code-block} cpp

#include <iostream>

int main() {

  // Capture everything by value

  int a{42};

  auto func = [=]() { std::cout << "Inner value : " << a << std::endl; };

  for (size_t i{}; i < 5; ++i) {
    std::cout << "Outer value : " << a << std::endl;
    func();
    ++a;
  }

  // Capturing all reference
  int c{42};
  int d{5};
  std::cout << std::endl;
  auto func1 = [&]() {
    std::cout << "Inner value : " << c << std::endl;
    std::cout << "Inner value(d) : " << d << std::endl;
  };

  for (size_t i{}; i < 5; ++i) {
    std::cout << "Outer value : " << c << std::endl;
    func1();
    ++c;
  }

  return 0;
}
