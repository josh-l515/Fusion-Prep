# 1.10 Function Parameters, Return Types, and Overloading

## 1.10.1 Input and Output Parameters

A function can receive input values through regular parameters and return a result through an output parameter.

An output parameter is usually passed by reference or by pointer so that the function can modify a variable declared in the caller.

**Syntax**
```{code-block} cpp
void function_name(input_type input, output_type& output);
```

or

```{code-block} cpp
void function_name(input_type input, output_type* output);
```

- Input parameters provide the data needed by the function.
- Output parameters store the result produced by the function.
- Output parameters are commonly passed by reference or pointer.
- The caller must provide a valid variable to store the result.

Using a reference as an output parameter:

```{code-block} cpp
void max_int(int input1, int input2, int& output)
```

The function compares `input1` and `input2` and stores the largest value in `output`.

```{code-block} cpp
if (input1 > input2) {
    output = input1;
} else {
    output = input2;
}
```

Because `output` is a reference, assigning to it modifies the variable passed by the caller.

Example:

```{code-block} cpp
int result;
max_int(10, 20, result);
```

After the call:

```{code-block} cpp
result    // 20
```

A pointer can also be used as an output parameter:

```{code-block} cpp
void max_double(double input1, double input2, double* output)
```

In this case, the caller passes the address of the variable where the result should be stored.

```{code-block} cpp
double result;
max_double(10.5, 20.5, &result);
```

Inside the function, the pointer must be dereferenced to write the result:

```{code-block} cpp
*output = input1;
```

or

```{code-block} cpp
*output = input2;
```

The following example shows both approaches:

```{code-block} cpp
#include <iostream>

void max_int(int input1, int input2, int &output) {
  if (input1 > input2) {
    output = input1;
  } else {
    output = input2;
  }
}

void max_double(double input1, double input2, double *output) {
  if (input1 > input2) {
    *output = input1;
  } else {
    *output = input2;
  }
}

int main() {

  int out_int;
  int in1{45};
  int in2{723};
  max_int(in1, in2, out_int);
  std::cout << "max_int : " << out_int << std::endl;

  double out_double;
  double in_double1{45.8};
  double in_double2{76.9};
  max_double(in_double1, in_double2, &out_double);
  std::cout << "max_double : " << out_double << std::endl;

  return 0;
}
```

Typical output:

```{code-block} text
max_int : 723
max_double : 76.9
```

References are usually preferred for output parameters because they are easier to use and do not require explicit dereferencing.

Pointers are useful when the output parameter may be optional or allowed to be `nullptr`.

## 1.10.2 Returning by Value

A function can return a value directly. In this case, the returned value is copied from the function to the caller.

**Syntax**
```{code-block} cpp
return_type function_name(parameters)
{
    return value;
}
```

- The function creates a local variable.
- The local variable is returned to the caller.
- The caller receives its own copy of the returned value.
- The local variable inside the function is destroyed when the function ends.
- The returned object and the variable in the caller have different memory addresses.

```{code-block} cpp
int sum(int a, int b)
{
    int result = a + b;
    return result;
}
```

In this example, `result` is a local variable inside the function. After `return result;`, its value is copied to the variable that receives the return value.

```{code-block} cpp
int total = sum(10,20);
```

After the call:

```{code-block} cpp
total    // 30
```

Although `result` and `total` contain the same value, they are different variables stored at different memory addresses.

The same idea applies to objects such as `std::string`:

```{code-block} cpp
std::string add_strings(std::string str1, std::string str2)
{
    std::string result = str1 + str2;
    return result;
}
```

The function returns a copy of `result`, which is then stored in the caller.

The following example shows that the address of the local variable inside the function is different from the address of the variable that receives the returned value.

```{code-block} cpp
#include <iostream>

int sum(int a, int b) {
  int result = a + b;
  std::cout << "In : &result(int) :  " << &result << std::endl;
  return result;
}

std::string add_strings(std::string str1, std::string str2) {
  std::string result = str1 + str2;
  std::cout << "In : &result(std::string) :  " << &result << std::endl;
  return result;
}

int main() {

  int x{15};
  int y{9};
  int result = sum(x, y);
  std::cout << "Out : &result(int) :  " << &result << std::endl;
  std::cout << "result : " << result << std::endl;

  std::string in_str1{"Hello"};
  std::string in_str2{" World!"};
  std::string result_str = add_strings(in_str1, in_str2);
  std::cout << "Out : &result_str(std::string) :  " << &result_str << std::endl;
  std::cout << "result_str : " << result_str << std::endl;

  return 0;
}
```

Typical output:

```{code-block} text
In : &result(int) :  0x61fefc
Out : &result(int) :  0x61ff08
result : 24

In : &result(std::string) :  0x61feb0
Out : &result_str(std::string) :  0x61ff20
result_str : Hello World!
```

The addresses are different because the variables inside the functions are local variables, while `result` and `result_str` in `main` are separate objects.

Modern C++ compilers often optimize the copy through Return Value Optimization (RVO) or move semantics, but conceptually the function still returns by value.


## 1.10.3 Returning by Reference

A function may return a reference instead of a value.

```{code-block} cpp
return_type& function_name(parameters)
```

When a function returns a reference, no copy is made. The caller receives another name for an existing variable.

This is efficient because the returned object is not copied, but it is only safe if the reference refers to an object that still exists after the function returns.

### Safe Case: Returning a Reference to an Existing Object

```{code-block} cpp
int& max_return_reference(int& a, int& b)
{
    if(a > b){
        return a;
    }else{
        return b;
    }
}
```

`a` and `b` are references to variables declared in `main`. Since those variables still exist after the function ends, returning one of them is safe.

Example:

```{code-block} cpp
int x{14};
int y{9};

int& ref_max = max_return_reference(x,y);
```

If `x` is larger, `ref_max` becomes another name for `x`.

```{code-block} cpp
ref_max++;
```

This modifies `x` directly.

```{code-block} text
x = 15
ref_max = 15
```

The following code demonstrates this behavior:

```{code-block} cpp
int x{14};
int y{9};

int& ref_max = max_return_reference(x,y);
int val = max_return_reference(x,y);

std::cout << "ref_max : " << ref_max << std::endl;
std::cout << "val : " << val << std::endl;

ref_max++;

std::cout << "ref_max : " << ref_max << std::endl; // 15
std::cout << "val : " << val << std::endl;         // 14
std::cout << "x : " << x << std::endl;             // 15
```

- `ref_max` is a reference to `x`
- `val` is only a copy of the returned value
- Changing `ref_max` changes `x`
- Changing `val` would not affect `x`

---

### Dangerous Case: Returning a Reference to a Local Variable

```{code-block} cpp
int& sum(int& a, int& b)
{
    int result = a + b;
    return result;
}
```

This is wrong.

`result` is a local variable created inside the function. It is destroyed when the function ends.

After the function returns, the reference points to memory that no longer belongs to a valid variable. This is called a dangling reference.

```{code-block} cpp
int& result = sum(x,y);
```

At this point, `result` refers to invalid memory. Using it produces undefined behavior.

The program may:

- Print a strange number
- Crash
- Seem to work sometimes
- Behave differently each time

This function should instead return by value:

```{code-block} cpp
int sum(int a, int b)
{
    int result = a + b;
    return result;
}
```

---

### Dangerous Case: Returning a Reference to Parameters Passed by Value

```{code-block} cpp
int& max_input_by_value(int a, int b)
{
    if(a > b){
        return a;
    }else{
        return b;
    }
}
```

This is also wrong.

`a` and `b` are passed by value, so they are local copies created inside the function.

Even though they come from `x` and `y`, inside the function they are completely different variables with different addresses.

When the function ends, `a` and `b` are destroyed.

Returning a reference to either of them creates another dangling reference.

```{code-block} cpp
int& result = max_input_by_value(x,y);
```

`result` now refers to memory that is no longer valid.

A useful way to think about it is:

```{code-block} text
x ----> copied into local a
y ----> copied into local b
return a or b
a and b destroyed
reference now points to destroyed memory
```

Therefore:

- Safe: return references to objects that exist outside the function
- Unsafe: return references to local variables
- Unsafe: return references to parameters passed by value

A safe version is:

```{code-block} cpp
int& max_input_by_reference(int& a, int& b)
{
    if(a > b){
        return a;
    }else{
        return b;
    }
}
```

because `a` and `b` are references to variables that continue to exist after the function returns.

## 1.10.4 Function Overloading

Function overloading allows multiple functions to have the same name as long as their parameter lists are different.

The compiler chooses the correct function based on:

- Number of parameters
- Parameter types
- Parameter order

```{code-block} cpp
int max(int a, int b);
double max(double a, double b);
```

These functions have the same name, `max`, but different parameter types, so both are allowed.

---

### Example

```{code-block} cpp
#include <iostream>

int max(int a, int b){
    std::cout << "int overload called" << std::endl;
    return (a>b)? a : b;
}

double max(double a, double b){
    std::cout << "double overload called" << std::endl;
    return (a>b)? a : b;
}
```

When the function is called:

```{code-block} cpp
max(3,5);
```

the compiler selects:

```{code-block} cpp
int max(int a, int b)
```

because both arguments are integers.

If the call is:

```{code-block} cpp
max(3.5,7.2);
```

the compiler selects:

```{code-block} cpp
double max(double a, double b)
```

because both arguments are `double`.

---

### Overloading by Parameter Type and Order

You may also overload using different combinations and order of parameter types:

```{code-block} cpp
double max(int a, double b);
double max(double a, int b);
```

These are different functions because their parameter order is different.

```{code-block} cpp
max(10, 5.5);   // Calls max(int,double)
max(5.5, 10);   // Calls max(double,int)
```

---

### Overloading by Number of Parameters

Functions may also differ in the number of parameters:

```{code-block} cpp
double max(double a, int b, int c);
```

Example:

```{code-block} cpp
max(5.4, 3, 7);
```

This call selects:

```{code-block} cpp
double max(double a, int b, int c)
```

because it is the only overload with three parameters.

---

### Example with Strings

```{code-block} cpp
std::string_view max(std::string_view a, std::string_view b){
    return (a>b)? a : b;
}
```

This overload compares two strings lexicographically.

```{code-block} cpp
max("Hello","World");
```

The string literals are converted to `std::string_view`, so this overload is selected.

Since `"World"` is alphabetically greater than `"Hello"`, the function returns `"World"`.

---

### Complete Example

```{code-block} cpp
#include <iostream>
#include <string_view>

int max(int a, int b){
    std::cout << "int overload called" << std::endl;
    return (a>b)? a : b;
}

double max(double a, double b){
    std::cout << "double overload called" << std::endl;
    return (a>b)? a : b;
}

double max(int a, double b){
    std::cout << "(int,double) overload called" << std::endl;
    return (a>b)? a : b;
}

double max(double a, int b){
    std::cout << "(double,int) overload called" << std::endl;
    return (a>b)? a : b;
}

double max(double a, int b,int c){
    std::cout << "(double,int,int) overload called" << std::endl;
    return a;
}

std::string_view max(std::string_view a, std::string_view b){
    std::cout << "(string_view,string_view) overload called" << std::endl;
    return (a>b)? a : b;
}

int main(){

    int x{4};
    int y{9};
    double a{5.4};
    double b{7.4};

    auto result = max(b,x,y);

    max("Hello","World");

    return 0;
}
```

Typical output:

```{code-block} text
(double,int,int) overload called
(string_view,string_view) overload called
```


