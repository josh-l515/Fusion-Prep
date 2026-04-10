# 1.8 References

## 1.8.1 Declaring And Using References

A reference is an alias for an existing variable. Once a reference is declared, it refers to the same memory location as the original variable.

**Syntax**
```{code-block} cpp
type& reference_name{variable};
```

- A reference must be initialized when it is declared.
- A reference does not create a new object in memory.
- The reference and the original variable share the same address.
- Modifying the original variable changes the reference.
- Modifying the reference changes the original variable.
- References cannot be null.
- References cannot later be changed to refer to another variable.

```{code-block} cpp
int value{10};
int& ref_value{value};
```

In this example, `ref_value` becomes another name for `value`.

The following program shows that the reference and the original variable always contain the same value and share the same memory address.

```{code-block} cpp
#include <iostream>

int main() {

  int int_data{33};
  double double_data{55};

  // References
  int &ref_int_data{int_data};
  double &ref_double_data{double_data};

  // Print stuff out
  std::cout << "int_data : " << int_data << std::endl;
  std::cout << "&int_data : " << &int_data << std::endl;
  std::cout << "double_data : " << double_data << std::endl;
  std::cout << "&double_data : " << &double_data << std::endl;

  std::cout << "=======================" << std::endl;

  std::cout << "ref_int_data : " << ref_int_data << std::endl;
  std::cout << "&ref_int_data : " << &ref_int_data << std::endl;
  std::cout << "ref_double_data : " << ref_double_data << std::endl;
  std::cout << "&ref_double_data : " << &ref_double_data << std::endl;

  int_data = 111;
  double_data = 67.2;

  // Print stuff out
  std::cout << std::endl;
  std::cout << "int_data : " << int_data << std::endl;
  std::cout << "&int_data : " << &int_data << std::endl;
  std::cout << "double_data : " << double_data << std::endl;
  std::cout << "&double_data : " << &double_data << std::endl;

  std::cout << "=======================" << std::endl;

  std::cout << "ref_int_data : " << ref_int_data << std::endl;
  std::cout << "&ref_int_data : " << &ref_int_data << std::endl;
  std::cout << "ref_double_data : " << ref_double_data << std::endl;
  std::cout << "&ref_double_data : " << &ref_double_data << std::endl;

  ref_int_data = 1012;
  ref_double_data = 1000.45;

  // Print stuff out
  std::cout << std::endl;
  std::cout << "int_data : " << int_data << std::endl;
  std::cout << "&int_data : " << &int_data << std::endl;
  std::cout << "double_data : " << double_data << std::endl;
  std::cout << "&double_data : " << &double_data << std::endl;

  std::cout << "=======================" << std::endl;

  std::cout << "ref_int_data : " << ref_int_data << std::endl;
  std::cout << "&ref_int_data : " << &ref_int_data << std::endl;
  std::cout << "ref_double_data : " << ref_double_data << std::endl;
  std::cout << "&ref_double_data : " << &ref_double_data << std::endl;

  return 0;
}
```

After `int_data` and `double_data` are modified, the references automatically reflect the new values because they refer to the same memory location.


## 1.8.2 Pointers vs References

Pointers and references can both be used to access another variable indirectly, but they behave differently.

A reference is an alias for an existing variable, while a pointer stores the memory address of a variable.

**Syntax**
```{code-block} cpp
double value{12.34};

double& ref_value{value};   // Reference
double* p_value{&value};    // Pointer
```

- A reference must be initialized when declared.
- A pointer may be uninitialized or set to `nullptr`.
- A reference always refers to the same variable.
- A pointer can later be changed to point to another variable.
- To access the value stored through a pointer, the dereference operator `*` is used.
- A reference is used directly, without dereferencing.

```{code-block} cpp
double value{12.34};

double& ref_value{value};
double* p_value{&value};

std::cout << ref_value << std::endl;   // 12.34
std::cout << *p_value << std::endl;    // 12.34
```

Both the pointer and the reference can be used to modify the original variable:

```{code-block} cpp
*p_value = 15.44;
ref_value = 18.44;
```

After these assignments, `value` is also modified because both `p_value` and `ref_value` access the same object.

Unlike a reference, a pointer can later be made to point somewhere else.

```{code-block} cpp
double value{12.34};
double other_value{78.45};

double& ref_value{value};
double* p_value{&value};

ref_value = other_value;
```

The assignment above does not make `ref_value` refer to `other_value`. Instead, it copies the value of `other_value` into `value`.

After the assignment:

```{code-block} cpp
value        // 78.45
other_value  // 78.45
```

The reference still refers to `value`.

A pointer behaves differently:

```{code-block} cpp
p_value = &other_value;
```

Now `p_value` stores the address of `other_value`, so dereferencing the pointer accesses `other_value` instead of `value`.

The following example compares both behaviors:

```{code-block} cpp
#include <iostream>

int main() {

  // Declare pointer and reference

  double double_value{12.34};
  double &ref_double_value{double_value}; // Reference to double_value
  double *p_double_value{&double_value};  // Pointer to double_value

  // Reading
  std::cout << "double_value : " << double_value << std::endl;
  std::cout << "ref_double_value : " << ref_double_value << std::endl;
  std::cout << "p_double_value : " << p_double_value << std::endl;
  std::cout << "*p_double_value : " << *p_double_value << std::endl;

  // Writting through pointer
  *p_double_value = 15.44;

  std::cout << std::endl;
  std::cout << "double_value : " << double_value << std::endl;
  std::cout << "ref_double_value : " << ref_double_value << std::endl;
  std::cout << "p_double_value : " << p_double_value << std::endl;
  std::cout << "*p_double_value : " << *p_double_value << std::endl;

  // Writting through reference
  ref_double_value = 18.44;

  std::cout << std::endl;
  std::cout << "double_value : " << double_value << std::endl;
  std::cout << "ref_double_value : " << ref_double_value << std::endl;
  std::cout << "p_double_value : " << p_double_value << std::endl;
  std::cout << "*p_double_value : " << *p_double_value << std::endl;

  double some_other_double{78.45};

  // Make the reference reference something else.
  ref_double_value = some_other_double;
  std::cout << std::endl;
  std::cout << "Making the reference reference something else..." << std::endl;
  std::cout << std::endl;
  std::cout << "double_value : " << double_value << std::endl;
  std::cout << "ref_double_value : " << ref_double_value << std::endl;
  std::cout << "p_double_value : " << p_double_value << std::endl;
  std::cout << "*p_double_value : " << *p_double_value << std::endl;

  // Make the pointer point to something else
  p_double_value = &some_other_double;
  std::cout << std::endl;
  std::cout << "Making the pointer point somewhere else..." << std::endl;
  std::cout << std::endl;
  std::cout << "double_value : " << double_value << std::endl;
  std::cout << "ref_double_value : " << ref_double_value << std::endl;
  std::cout << "&double_value : " << &double_value << std::endl;
  std::cout << "&ref_double_value : " << &ref_double_value << std::endl;
  std::cout << "p_double_value : " << p_double_value << std::endl;
  std::cout << "*p_double_value : " << *p_double_value << std::endl;

  *p_double_value = 555.5;

  std::cout << std::endl;
  std::cout << "double_value : " << double_value << std::endl;
  std::cout << "ref_double_value : " << ref_double_value << std::endl;
  std::cout << "&double_value : " << &double_value << std::endl;
  std::cout << "&ref_double_value : " << &ref_double_value << std::endl;
  std::cout << "p_double_value : " << p_double_value << std::endl;
  std::cout << "*p_double_value : " << *p_double_value << std::endl;

  return 0;
}
```

## 1.8.3 Const References

A const reference is a reference that cannot be used to modify the object it refers to.

**Syntax**
```{code-block} cpp
const type& reference_name{variable};
```

- A const reference must be initialized when declared.
- A const reference can read the value of the original variable.
- A const reference cannot modify the original variable.
- Const references are commonly used when a value should be accessed without copying and without allowing modification.

```{code-block} cpp
int age{27};
const int& ref_age{age};
```

In this example, `ref_age` refers to `age`, but it cannot be used to change the value stored in `age`.

```{code-block} cpp
std::cout << age << std::endl;      // 27
std::cout << ref_age << std::endl;  // 27
```

Trying to modify the value through the const reference causes a compilation error:

```{code-block} cpp
ref_age++;   // Error
```

The reason is that `ref_age` is read-only.

The original variable may still be modified directly:

```{code-block} cpp
age = 30;
```

After this assignment:

```{code-block} cpp
age      // 30
ref_age  // 30
```

The const reference still reflects the updated value because it continues to refer to `age`.

A const reference behaves similarly to a const pointer to const data:

```{code-block} cpp
const int* const p_age{&age};
```

In this declaration:

- The first `const` means the pointed value cannot be modified.
- The second `const` means the pointer cannot point somewhere else.

The following example shows the use of a const reference:

```{code-block} cpp
#include <iostream>

int main() {

  // Non const reference
  std::cout << std::endl;
  std::cout << "Non const reference : " << std::endl;
  int age{27};
  const int &ref_age{age};
  /*
  std::cout << "age : " << age << std::endl;
  std::cout << "ref_age : " << ref_age << std::endl;


  //Can modify original variable through reference

  std::cout << std::endl;
  std::cout << "Modify original variable through reference : " << std::endl;

  ref_age++; //Mofify through reference

  std::cout << "age : " << age << std::endl;
  std::cout << "ref_age : " << ref_age << std::endl;
*/

  // Simulating reference behavior with pointers
  // const int * const p_age {&age};
  //*p_age = 45;

  return 0;
}
```
