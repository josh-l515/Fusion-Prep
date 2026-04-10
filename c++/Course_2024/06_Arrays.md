# 1.6 Arrays 
## 1.6.1 Declaring Arrays

An **array** is a collection of elements of the same type stored in **contiguous memory locations**.  
Arrays allow storing multiple values under a single variable name and accessing them using an **index**.

In C++, array indexing **starts at `0`**, meaning the first element is accessed with index `0`.

**Syntax**

```{code-block} cpp
type array_name[size];
```

Example:

```{code-block} cpp
int a[10];
```

- This array can store **10 integers**.
- If an array is declared **without initialization**, its elements contain **uninitialized (junk) data**.
- Array elements are accessed using the **index operator `[]`**.
- The last valid index is **size - 1**.

### Accessing Array Elements

Array elements can be **read or written** using their index.

```{code-block} cpp
a[0] = 21;
a[1] = 22;
a[2] = 23;
```

Arrays are commonly accessed using **loops**, especially `for` loops.

```{code-block} cpp
for(size_t i{0}; i < 10; ++i){
    std::cout << a[i] << std::endl;
}
```

### Initialization at Declaration

Arrays can be initialized **when they are declared**.

```{code-block} cpp
double b[5]{1.2, 1.3, 1.4, 4.1, 3.14};
```

- Each value is assigned sequentially to the array elements.

### Partial Initialization

If fewer elements are provided than the declared array size, the remaining elements are **automatically initialized to `0`**.

```{code-block} cpp
double c[10]{1.2, 1.3, 1.4, 4.1, 3.14};
```

- The first elements receive the provided values.
- The rest are initialized to **0.0**.

### Omitting the Array Size

If values are provided, the compiler can **deduce the array size automatically**.

```{code-block} cpp
int d[]{1,2,3,4,5};
```

- The array size becomes **5**.

### Range-Based For Loop

C++ provides a **range-based for loop** to simplify iteration over arrays.

```{code-block} cpp
for(auto value : d){
    std::cout << value << std::endl;
}
```

- `auto` lets the compiler **deduce the variable type automatically**.
- `value` receives each element of the array.


```{code-block} cpp
#include <cstddef>
#include <iostream>

int main() {

  // Declare an array of ints
  int a[10]; // Junk data

  // Read Data
  std::cout << "a[0]: " << a[0] << std::endl;

  // Read data with for loop
  std::cout << "........." << std::endl;
  for (size_t i{0}; i < 10; ++i) {
    std::cout << "a[" << i << "]: " << a[i] << std::endl;
  }

  // Write Data manually
  std::cout << "........." << std::endl;
  a[0] = 21;
  a[1] = 22;
  a[2] = 23;

  // Read data with for loop
  for (size_t j{0}; j < 10; ++j) {
    std::cout << "a[" << j << "]: " << a[j] << std::endl;
  }

  // Write data with a for loop
  std::cout << "........." << std::endl;
  for (size_t k{0}; k < 10; ++k) {
    a[k] = 20 + k;
    std::cout << "a[" << k << "]: " << a[k] << std::endl;
  }

  // Declare and initialize at the same time
  std::cout << "........." << std::endl;
  double b[5]{1.2, 1.3, 1.4, 4.1, 3.14};

  for (size_t l{0}; l < 5; ++l) {
    std::cout << "b[" << l << "]: " << b[l] << std::endl;
  }

  // If you don't initialize all the elements, the remaining are set to 0
  std::cout << "........." << std::endl;
  double c[10]{1.2, 1.3, 1.4, 4.1, 3.14};

  for (size_t l{0}; l < 10; ++l) {
    std::cout << "c[" << l << "]: " << c[l] << std::endl;
  }

  // Omit the size of the array at declaration
  std::cout << "........." << std::endl;
  int d[]{1, 2, 3, 4, 5};

  // Range-based loop
  for (auto i : d) {
    std::cout << "value: " << i << std::endl;
  }

  // Sum elements of an array
  std::cout << "........." << std::endl;
  int e[]{1, 2, 3, 4, 5, 6, 7, 8};
  int sum{0};

  for (auto i : e) {
    sum += i;
  }

  std::cout << "sum: " << sum << std::endl;

  return 0;
}
```

## 1.6.2 Getting the Size of an Array

When working with arrays, it is often necessary to know **how many elements the array contains**.  
Modern C++ provides a convenient way to obtain the size of an array using **`std::size()`**, introduced in **C++17**.

**Using `std::size()` (C++17 and later)**

```{code-block} cpp
int a[]{11, 12, 13, 14, 15, 16, 17, 18};
int COUNT{std::size(a)};
```

- `std::size()` returns the **number of elements** in the array.
- It is defined in the **`<iterator>`** header.
- This is the **recommended and safest approach in modern C++**.

### Before C++17

Before `std::size()` was introduced, programmers commonly calculated the array size using the **`sizeof` operator**.

```{code-block} cpp
sizeof(array) / sizeof(array[0])
```

Explanation:

- `sizeof(array)` returns the **total size in bytes of the entire array**.
- `sizeof(array[0])` returns the **size of a single element**.
- Dividing both values gives the **number of elements in the array**.

### Range-Based Loop Alternative

A **range-based for loop** can iterate through all elements without needing the array size.

```{code-block} cpp
for(auto value : a){
    std::cout << value << std::endl;
}
```

- This approach is **cleaner and safer**.
- However, the **index is not available**, which may be necessary in some situations.

---

```{code-block} cpp
#include <cstddef>
#include <iostream>
#include <iterator>

int main() {

  int a[]{11, 12, 13, 14, 15, 16, 17, 18};

  // Modern approach (C++17)
  int COUNT{std::size(a)};

  for (size_t i{0}; i < COUNT; ++i) {
    std::cout << "a[" << i << "]: " << a[i] << std::endl;
  }

  // Before C++17
  std::cout << "........." << std::endl;
  std::cout << "size_of(a[]): " << sizeof(a) << std::endl;
  std::cout << "size_of(a[0]): " << sizeof(a[0]) << std::endl;

  int COUNT1{sizeof(a) / sizeof(a[0])};

  for (size_t i{0}; i < COUNT1; ++i) {
    std::cout << "a[" << i << "]: " << a[i] << std::endl;
  }

  // Range-based loop (no index available)
  std::cout << "........." << std::endl;
  for (auto i : a) {
    std::cout << "value: " << i << std::endl;
  }

  return 0;
}
```


## 1.6.3 Character Arrays and C-Strings

A **character array** is an array whose elements are of type `char`.  
Character arrays are commonly used to represent **text** in C and early C++ programs.

However, for a character array to behave like a **string**, it must be **null terminated**.

A **null-terminated string** ends with a special character:

```{code-block} cpp
'\0'
```

This character tells the program **where the string ends**.

### Character Array Without Null Terminator

```{code-block} cpp
char a[]{'H','E','L','L','O'};
```

- This is **not a proper string**.
- It is simply an array of characters.
- When printed character-by-character it works, but printing it as a string may lead to **garbage output**.

### Modifying Characters

Individual characters in the array can be modified using their index.

```{code-block} cpp
a[1] = 'A';
```

### C-Strings (Null-Terminated Character Arrays)

If the array ends with `'\0'`, it becomes a **C-String**.

```{code-block} cpp
char b[]{'H','E','L','L','O','\0'};
```

- The `'\0'` marks the **end of the string**.
- Now it can safely be printed with `std::cout`.

### Automatic Null Terminator

Another common technique is declaring an array **with extra space**, allowing the compiler to insert the null character automatically.

```{code-block} cpp
char c[6]{'H','e','l','l','o'};
```

- The last element is automatically set to `'\0'`.

### Character Array Without Null Terminator

```{code-block} cpp
char d[]{'H','e','l','l','o'};
```

- This array **does not contain `'\0'`**.
- Printing it as a string may produce **unexpected output**.

### String Literals

When a string literal is assigned to a character array, the compiler **automatically adds the null terminator**.

```{code-block} cpp
char e[]{"HELLO"};
```

Memory layout:

```
H E L L O \0
```

Even though the string has **5 visible characters**, the array size becomes **6 bytes** because of the null terminator.

### Printing Non-Character Arrays

Arrays of other types **cannot be printed directly** using `std::cout`.

```{code-block} cpp
int f[]{1,2,3,4,5};
std::cout << f;
```

This prints a **memory address (pointer)** rather than the array elements.

To print elements correctly, a **loop must be used**.

---

```{code-block} cpp
#include <cstddef>
#include <iostream>

int main() {

  char a[]{'H', 'E', 'L', 'L', 'O'};
  int COUNT{std::size(a)};

  // Print characters one by one
  for (size_t i{0}; i < COUNT; ++i) {
    std::cout << a[i];
  }

  // Modifying characters
  std::cout << std::endl;
  a[1] = 'A';

  for (size_t i{0}; i < COUNT; ++i) {
    std::cout << a[i];
  }

  // Null terminated string
  std::cout << std::endl;
  char b[]{'H', 'E', 'L', 'L', 'O', '\0'};
  std::cout << b << std::endl;

  // Compiler adds the null terminator automatically
  char c[6]{'H', 'e', 'l', 'l', 'o'};
  std::cout << "c : " << c << std::endl;
  std::cout << "sizeof(c) : " << sizeof(c) << std::endl;

  // Not a C-string (no null character)
  char d[]{'H', 'e', 'l', 'l', 'o'};
  std::cout << "d : " << d << std::endl;
  std::cout << "sizeof(d) : " << sizeof(d) << std::endl;

  // String literal (automatically null terminated)
  char e[]{"HELLO"};
  std::cout << "e : " << e << std::endl;
  std::cout << "sizeof(e): " << sizeof(e) << std::endl;

  // Non-character arrays can't be printed directly
  int f[]{1, 2, 3, 4, 5};
  std::cout << "f: " << f << std::endl;

  return 0;
}
```

## 1.6.4 Array Bounds and Out-of-Bounds Access

When working with arrays in C++, it is **very important to respect the valid index range** of the array.

If an array has `N` elements, the **valid indexes are**:

```
0 ... N-1
```

Accessing an index outside this range is called **out-of-bounds access**.

This behavior leads to **undefined behavior**, which means the program may:

- read **garbage data**
- **corrupt memory**
- **crash**
- appear to work sometimes but fail later

### Reading Beyond Array Bounds

```{code-block} cpp
numbers[12]
```

If the array contains only 10 elements, index `12` refers to **memory that does not belong to the array**.

Possible consequences:

- random values (garbage data)
- unpredictable program behavior
- segmentation faults

### Writing Beyond Array Bounds

```{code-block} cpp
numbers[129] = 1000;
```

This is **even more dangerous** because it modifies memory that **the program does not own**.

This may:

- corrupt other variables
- corrupt the program stack
- corrupt data used elsewhere in the program
- cause crashes later in execution

The compiler usually **does not prevent this**, because standard C++ arrays **do not perform bounds checking**.



```{code-block} cpp
#include <iostream>

int main() {

  int numbers[]{1, 2, 3, 4, 5, 6, 7, 8, 9, 0};

  // Read beyond bounds : Will read garbage or crash your program
  // std::cout << "numbers[12] : " << numbers[12] << std::endl;

  // Write beyond bounds. The compiler allows it. But you don't own
  // the memory at index 12, so other programs may modify it and your
  // program may read bogus data at a later time. Or you can even
  // corrupt data used by other parts of your program

  std::cout << "numbers[120] : " << numbers[120] << std::endl;

  numbers[129] = 1000;

  std::cout << "numbers[129] : " << numbers[129] << std::endl;

  std::cout << "Program ending...." << std::endl;

  return 0;
}
```
