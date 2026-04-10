# 1.7 Pointers 
## 1.7.1 Declaring and using pointers

A **pointer** is a variable that stores the **memory address of another variable**.  
Pointers are a fundamental concept in C++ and are widely used for **memory management, efficient data manipulation, and low-level programming**.

### Declaring Pointers

Pointers are declared using the `*` symbol.

```{code-block} cpp
int* p;
double* q;
```

When a pointer is declared but not explicitly initialized, it is good practice to initialize it to **`nullptr`**.

```{code-block} cpp
int* p{nullptr};
```

`nullptr` represents a pointer that **does not point to any valid memory location**.

### Pointer Size

Pointers store **memory addresses**, not actual data values.  
Because of this, the **size of a pointer is the same regardless of the data type it points to**.

Example:

```{code-block} cpp
sizeof(int*) 
sizeof(double*)
```

On most **64-bit systems**, pointers typically occupy **8 bytes**, while on **32-bit systems** they usually occupy **4 bytes**.

### Pointer Declaration Style

The `*` symbol can be placed either next to the **type** or the **variable name**.

```{code-block} cpp
int* a;
int *b;
```

Both are valid, but consistency is recommended.

However, declaring multiple variables on the same line can lead to confusion:

```{code-block} cpp
int *h{}, i{};
```

Here:

- `h` is a **pointer to int**
- `i` is a **regular integer**

For clarity, it is better to declare them separately.

```{code-block} cpp
int* l{};
int m{};
```

### Storing Addresses in Pointers

Pointers store the **memory address of variables**.  
The **address-of operator `&`** is used to obtain the address.

```{code-block} cpp
int n{41};
int* p{&n};
```

Now `p` holds the memory address of `n`.

### Changing the Address Stored in a Pointer

A pointer can later be reassigned to store the address of another variable.

```{code-block} cpp
int a{10};
int b{20};

int* p{&a};
p = &b;
```

Now the pointer points to `b`.

### Type Safety with Pointers

Pointers must point to **variables of the same type**.

```{code-block} cpp
int* p;
double x{3.14};

p = &x;   // Invalid
```

This produces a **compiler error** because the types do not match.

### Dereferencing a Pointer

To access the value stored at the address contained in a pointer, we use the **dereference operator `*`**.

```{code-block} cpp
int value{10};
int* p{&value};

std::cout << *p;
```

- `p` contains the **address**
- `*p` accesses the **value stored at that address**

This operation is called **dereferencing the pointer**.

---

```{code-block} cpp
#include <cstddef>
#include <iostream>

int main() {

  int *a{}; // initialized with nullptr
  double *b{};

  // Explicitly initialize with nullptr
  int *c{nullptr};
  double *d{nullptr};

  // Pointers to different variables are of the same size
  std::cout << "sizeof(int) : " << sizeof(int) << std::endl;
  std::cout << "sizeof(double) : " << sizeof(double) << std::endl;
  std::cout << "sizeof(double*) : " << sizeof(double *) << std::endl;
  std::cout << "sizeof(int*) : " << sizeof(int *) << std::endl;
  std::cout << "sizeof(a) : " << sizeof(a) << std::endl;
  std::cout << "sizeof(b) : " << sizeof(b) << std::endl;

  // Pointer declaration styles
  std::cout << "..................." << std::endl;
  int *e{nullptr};
  int *f{nullptr};
  int *g{nullptr};

  int *h{}, i{};
  int *j{}, k{};

  std::cout << "sizeof(h) : " << sizeof(h) << std::endl;
  std::cout << "sizeof(i) : " << sizeof(i) << std::endl;
  std::cout << "sizeof(j) : " << sizeof(j) << std::endl;
  std::cout << "sizeof(k) : " << sizeof(k) << std::endl;

  // Better practice
  std::cout << "..................." << std::endl;
  int *l{};
  int m{};

  // Assigning addresses to pointers
  int n{41};
  int *o{&n};

  std::cout << "int n : " << n << std::endl;
  std::cout << "address of n : " << o << std::endl;

  // Changing pointer address
  std::cout << "..................." << std::endl;
  int p{26};
  o = &p;
  std::cout << "new address stored in pointer : " << o << std::endl;

  // Can't cross assign between pointers of different types
  int *q{nullptr};
  double r{33};

  // q = &r; // Compiler error

  // Dereferencing a pointer
  std::cout << "..................." << std::endl;
  int *s{nullptr};
  int t{71};

  s = &t;

  std::cout << "s address in memory : " << s << std::endl;
  std::cout << "t address in memory : " << &t << std::endl;

  std::cout << "s pointer value: " << *s << std::endl;
  std::cout << "t int value: " << t << std::endl;

  return 0;
}
```


## 1.7.2 Dynamic Memory Allocation

A variable declared normally is stored on the **stack**, while memory allocated with `new` is stored on the **heap**.

```{code-block} cpp
int a{24}; // stack allocation
int* p_a = &a;
```

- `a` lives on the stack (automatic lifetime)
- `p_a` stores the address of `a`

```{code-block} cpp
std::cout << "a:" << a << std::endl;
std::cout << "p_a:" << p_a << std::endl;
std::cout << "&a:" << &a << std::endl;
std::cout << "*p_a:" << *p_a << std::endl;
```

 
- `p_a` → address  
- `*p_a` → value at that address  



### Uninitialized Pointers

```{code-block} cpp
int* p_b; // uninitialized (contains garbage address)
int b{15};
p_b = &b;
```

A pointer declared without initialization contains an **indeterminate (junk) address**.

**Critical rule:** Never dereference an uninitialized pointer.

```{code-block} cpp
int* p;
*p = 55; // undefined behavior (very dangerous)
```

This may:
- Crash the program
- Corrupt memory
- Produce silent bugs



### Null Pointers

```{code-block} cpp
int* p_number3{};
```

- Initialized to `nullptr` (points to nothing)

Dereferencing a null pointer is invalid:

```{code-block} cpp
*p_number3 = 33; //  crash (segmentation fault)
```


### Dynamic Memory Allocation (Heap)

```{code-block} cpp
int* p_number4{nullptr};
p_number4 = new int; // allocate on heap
```

- `new` reserves memory and returns its address
- Memory persists until explicitly released

```{code-block} cpp
*p_number4 = 77;
```



### Releasing Memory

```{code-block} cpp
delete p_number4;
p_number4 = nullptr;
```

**Important:**
- `delete` frees heap memory
- Always reset pointer to `nullptr` after deletion

Otherwise, you create a **dangling pointer** (points to freed memory)

---

### Initialization at Declaration

```{code-block} cpp
int* p_number5{new int};     // uninitialized value (junk)
int* p_number6{new int(22)}; // direct initialization
int* p_number7{new int{23}}; // uniform initialization
```

- `new int` → garbage value  
- `new int(22)` / `{23}` → properly initialized  

Reading uninitialized heap memory is undefined:

```{code-block} cpp
std::cout << *p_number5; // unpredictable value
```

---

### Memory Leaks

```{code-block} cpp
int* p = new int{10};
// no delete → memory leak
```

- Memory is never returned
- Critical in long-running programs

---

### Reusing Pointers

```{code-block} cpp
p_number5 = new int{81};
```

Valid only if previous memory was properly deleted.

---

### Double Deletion

```{code-block} cpp
delete p_number5;
delete p_number5; // double free (serious error)
```
 Safe pattern:

```{code-block} cpp
delete p_number5;
p_number5 = nullptr;
```


```{code-block} cpp

#include <iostream>

int main(int argc, char *argv[]) {
  int a{24}; // allocated on stack
  int *p_a = &a;

  std::cout << std::endl;
  std::cout << "Declaring pointers and assigning address" << std::endl;
  std::cout << "a:" << a << std::endl;
  std::cout << "pointer to a (p_a):" << p_a << std::endl;
  std::cout << "&a:" << &a << std::endl;
  std::cout << "*p_a:" << *p_a << std::endl;

  int *p_b; // Uninitialize pointer, contains junk address
  int b{15};
  p_b = &b;
  std::cout << std::endl;
  std::cout << "Uninitialized pointer" << std::endl;
  std::cout << "p_b:" << p_b << std::endl;
  std::cout << "*p_b:" << *p_b << std::endl;

  /*
  // BAD
  // Writing into uninitialized pointer through dereference
  std::cout << std::endl;
  int* p_number2; // Contains junk address : could be anything
  std::cout << "Writting in the 55" << std::endl;
  *p_number2 = 55; // Writing into junk address : BAD!
  std::cout << "Writing into uninitialized pointer through dereference"
            << std::endl;
  std::cout << "p_number2 : " << p_number2
            << std::endl; // Reading from junk address.
  std::cout << "Dereferencing bad memory" << std::endl;
  std::cout << "*p_number2 : " << *p_number2 << std::endl;

  // Initializing pointer to null

  // int *p_number3{nullptr}; // Also works
  int *p_number3{}; // Initialized with pointer equivalent of zero : nullptr
                    // A pointer pointing nowhere
  std::cout << "Writting into nullptr memory" << std::endl;
  *p_number3 = 33; // Writting into a pointer pointing nowhere : BAD, CRASH
  std::cout << "Done writting" << std::endl;

  std::cout << std::endl;
  std::cout << "Reading and writting through nullptr : " << std::endl;
  std::cout << "p_number3 : " << p_number3 << std::endl;
  std::cout << "*p_number3 : " << *p_number3
            << std::endl; // Reading from nullptr BAD, CRASH.
  */

  // Dynamic heap memory
  int *p_number4{nullptr};
  p_number4 =
      new int; // Dynamically allocate space for a single int on the heap
               // This memory belongs to our program from now on. The system
               // can't use it for anything else, untill we return it.
               // After this line executes, we will have a valid memory location
               // allocated. The size of the allocated memory will be such that
               // it can store the type pointed to by the pointer

  *p_number4 = 77; // Writting into dynamically allocated memory
  std::cout << std::endl;
  std::cout << "Dynamically allocating memory : " << std::endl;
  std::cout << "*p_number4 : " << *p_number4 << std::endl;

  // Return memory to the OS
  delete p_number4;
  p_number4 = nullptr;

  // It is also possible to initialize the pointer with a valid
  // address up on declaration. Not with a nullptr
  int *p_number5{new int};     // Memory location contains junk value
  int *p_number6{new int(22)}; // use direct initialization
  int *p_number7{new int{23}}; // use uniform initialization

  std::cout << std::endl;
  std::cout << "Initialize with valid memory address at declaration : "
            << std::endl;
  std::cout << "p_number5 : " << p_number5 << std::endl;
  std::cout << "*p_number5 : " << *p_number5 << std::endl; // Junk value

  std::cout << "p_number6 : " << p_number6 << std::endl;
  std::cout << "*p_number6 : " << *p_number6 << std::endl;

  std::cout << "p_number7 : " << p_number7 << std::endl;
  std::cout << "*p_number7 : " << *p_number7 << std::endl;

  // Remember to release the memory
  delete p_number5;
  p_number5 = nullptr;

  delete p_number6;
  p_number6 = nullptr;

  delete p_number7;
  p_number7 = nullptr;

  // Reuse pointers
  p_number5 = new int{81};
  std::cout << "p_number5 : " << p_number5
            << std::endl; // diferent address than before.
  std::cout << "*p_number5 : " << *p_number5 << std::endl; // 81

  delete p_number5;
  p_number5 = nullptr;

  // Calling delete twice on a pointer : BAD!
  p_number5 = new int(99);
  std::cout << "*p_number5 : " << *p_number5 << std::endl;

  delete p_number5;
  // delete p_number5; // error double free detected in tcache

  p_number5 = nullptr;
  std::cout << "Program is ending well" << std::endl;
  return 0;
}
```

## 1.7.3 Dangling Pointers and Safe Usage Patterns

This section focuses on one of the most critical sources of bugs in C++: **dangling pointers** and unsafe pointer usage.

A **dangling pointer** is a pointer that:
- Points to **invalid memory**
- Refers to **memory that is no longer owned or valid**

---

### Case 1: Uninitialized Pointer

```{code-block} cpp
int* p_number; // uninitialized (contains garbage address)

std::cout << p_number << std::endl;
std::cout << *p_number << std::endl; //  CRASH
```

Problem:
- `p_number` contains an **indeterminate address**
- Dereferencing leads to **undefined behavior**

---

### Case 2: Deleted Pointer (Dangling After delete)

```{code-block} cpp
int* p_number1{new int{67}};

delete p_number1;

std::cout << *p_number1 << std::endl; //  undefined behavior
```

 Problem:
- Memory was **freed**, but pointer still holds the old address
- This is a **classic dangling pointer**

---

### Case 3: Multiple Pointers to Same Address

```{code-block} cpp
int* p_number3{new int{83}};
int* p_number4{p_number3};

delete p_number3;

std::cout << *p_number4 << std::endl; //  undefined behavior
```

 Problem:
- Both pointers reference the same memory
- After `delete`, **all aliases become invalid**

 This is especially dangerous in large systems (HPC, simulations, etc.)

---

### Solution 1: Always Initialize Pointers

```{code-block} cpp
int* p_number5{nullptr};
int* p_number6{new int(87)};

if(p_number6 != nullptr){
    std::cout << *p_number6 << std::endl;
}
```

 Benefits:
- Avoids garbage addresses
- Enables safe checks before dereferencing

---

### Solution 2: Reset After delete

```{code-block} cpp
int* p_number7{new int{82}};

delete p_number7;
p_number7 = nullptr;

if(p_number7 != nullptr){
    std::cout << *p_number7 << std::endl;
}else{
    std::cout << "Invalid memory access!" << std::endl;
}
```

 Key idea:
- After `delete`, pointer must be **explicitly invalidated**

---

### Solution 3: Ownership Discipline (Master Pointer)

```{code-block} cpp
int* p_number8{new int{382}}; // master pointer
int* p_number9{p_number8};    // non-owning (alias)
```

- Only **one pointer owns the memory** (responsible for `delete`)
- Others are **non-owning observers**

```{code-block} cpp
if(p_number8 != nullptr){
    std::cout << *p_number9 << std::endl;
}
```

After deletion:

```{code-block} cpp
delete p_number8;
p_number8 = nullptr;
```

```{code-block} cpp
if(p_number8 != nullptr){
    std::cout << *p_number9 << std::endl;
}else{
    std::cerr << "WARNING : Trying to use an invalid pointer" << std::endl;
}
```

 Important limitation:
- `p_number9` is still **dangling**
- Checking only the master pointer is a **discipline**, not a guarantee

C++ **does NOT track ownership automatically**.

This means:
- The compiler will NOT warn you
- The runtime will NOT protect you
- Errors may appear **far from the cause**


These problems are the reason modern C++ prefers:

- `std::unique_ptr` → exclusive ownership  
- `std::shared_ptr` → shared ownership  

 Raw pointers (`int*`) should be treated as:
- **Non-owning references**, or
- Used only in **low-level / performance-critical code**

---

```{code-block} cpp
#include <iostream>



int main(){

	//Case1 : Uninitialized pointer
    /*
	int * p_number; // Dangling uninitialized pointer
   
	std::cout << std::endl;
	std::cout << "Case 1 : Uninitialized pointer : ." << std::endl;
	std::cout << "p_number : " << p_number << std::endl;
    std::cout << "*p_number : " << *p_number << std::endl; //CRASH!
    */


   //Case 2 : deleted pointer
   /*
   std::cout << std::endl;
   std::cout << "Case 2 : Deleted pointer" << std::endl;
   int * p_number1 {new int{67}};
   
   std::cout << "*p_number1 (before delete) : " << *p_number1 << std::endl;
   
   delete p_number1;
		
   std::cout << "*p_number1(after delete) : " << *p_number1 << std::endl;
   */


	//Case 3 : Multiple pointers pointing to same address
    /*
	std::cout << std::endl;
	std::cout << "Case 3 : Multiple pointers pointing to same address : " << std::endl;
	
    int *p_number3 {new int{83}};
    int *p_number4 {p_number3};
    
    std::cout << "p_number3 - " << p_number3 << " - " << *p_number3 << std::endl;
    std::cout << "p_number4 - " << p_number4 << " - " << *p_number4 << std::endl;
    
    //Deleting p_number3
    delete p_number3;
    
    //p_number4 points to deleted memory. Dereferncing it will lead to
	//undefined behaviour : Crash/ garbage or whatever
    std::cout<< "p_number4(after deleting p_number3) - " << p_number4 << " - " << *p_number4 << std::endl;
    */


    //Solution1 : Initialize your pointers immediately upon declaration
    /*
	std::cout << std::endl;
	std::cout << "Solution 1 : " << std::endl;
    int *p_number5{nullptr};
    int *p_number6{new int(87)};
	
	//Check for nullptr before use

	if(p_number6!= nullptr){
		std::cout << "*p_number6 : " << *p_number6 << std::endl;
	}else{
        std::cout << "Invalid address" << std::endl;
    }
    */


	//Solution 2 : 
    //Right after you call delete on a pointer, remember to reset
	//the pointer to nullptr to make it CLEAR it doesn't point anywere
    /*
	std::cout << std::endl;
	std::cout << "Solution 2 : " << std::endl;
    int *p_number7{new int{82}};
    
    //Use the pointer however you want
    std::cout << "p_number7 - " << p_number7 << " - " << *p_number7 << std::endl;
   
    delete p_number7;
    p_number7 = nullptr; // Reset the pointer
	
	//Check for nullptr before use
	if(p_number7!= nullptr){
		std::cout << "*p_number7 : " << *p_number7 << std::endl;
	}else{
        std::cout << "Invalid memory access!" << std::endl;
    }
    */


	//Solution 3 
	//For multiple pointers pointing to the same address ,  Make sure there is
	//one clear pointer (master pointer) that owns the memory ( responsible for releasing when
    // necessary) , other pointers should only be able to dereference when the master pointer is valid
    
	std::cout << std::endl;
	std::cout << "Solution 3 : " << std::endl;
    int * p_number8 {new int{382}};// Let's say p_number8 is the master pointer
    int * p_number9 {p_number8};
    
    //Dereference the pointers and use them
    std::cout << "p_number8 - " << p_number8 << " - " << *p_number8 << std::endl;
    
    if(!(p_number8 == nullptr)){ // Only use slave pointers when master pointer is valid
           std::cout<< "p_number9 - " << p_number9 << " - " << *p_number9 << std::endl;
    }
    
    delete p_number8; // Master releases the memory
    p_number8 = nullptr;
    
    if(!(p_number8 == nullptr)){ // Only use slave pointers when master pointer is valid
           std::cout<< "p_number9 - " << p_number9 << " - " << *p_number9 << std::endl;
    }else{
        std::cerr << "WARNING : Trying to use an invalid pointer" << std::endl;
    }
    








    std::cout << "Program is ending well" << std::endl;
  
    return 0;
}
```

## 1.7.4 Handling Memory Allocation Failure

When using dynamic memory allocation with `new`, it is important to understand what happens when the system **cannot fulfill the allocation request**.

This typically occurs when:
- The requested memory is too large
- The system runs out of available heap memory

---

### Allocation Failure with `new`

```{code-block} cpp
int* data = new int[10000000000000000]; //  may fail
```

 Problem:
- This request is **unrealistically large**
- The allocation will likely fail at runtime

---

### Memory Leaks in Loops

```{code-block} cpp
for(size_t i{0}; i < 10000000; ++i){
    int* data = new int[100000000];
}
```

- Memory is allocated repeatedly
- **No `delete[]` is used**
- Leads to **massive memory leaks**

Even if each allocation succeeds initially, the program will eventually:
- Exhaust system memory
- Crash or slow down significantly

---

### Handling Exceptions from `new`

By default, `new` throws an exception of type `std::bad_alloc` if allocation fails.

```{code-block} cpp
try{
    int* data = new int[1000000000];
}catch(std::exception& ex){
    std::cout << "Something went wrong : " << ex.what() << std::endl;
}
```
- If allocation fails, control jumps to `catch`
- `ex.what()` typically returns `"std::bad_alloc"`
- If not handled, the program will **terminate**

---

### Using `std::nothrow`

An alternative is to prevent exceptions using `std::nothrow`.

```{code-block} cpp
int* data = new(std::nothrow) int[1000000000];
```

- Does **NOT throw exceptions**
- Returns `nullptr` if allocation fails

---

### Checking Allocation Success

```{code-block} cpp
if(data != nullptr){
    std::cout << "Data allocated" << std::endl;
}else{
    std::cout << "Data allocation failed" << std::endl;
}
```

 This is mandatory when using `std::nothrow`


| Method            | On Failure          |
|------------------|--------------------|
| `new`            | throws exception   |
| `new(nothrow)`   | returns `nullptr`  |

---


```{code-block} cpp
#include <iostream>

int main(){

    /*
    //int * data = new int[10000000000000000]; // 

    for(size_t i{0} ; i < 10000000 ; ++i){
        int * data = new int[100000000];
    }
    */

   //exception
   /*
    for(size_t i{0} ; i < 100 ; ++i){
        try{
            int * data = new int[1000000000];
        }catch(std::exception& ex){
            std::cout << "  Something went wrong : " << ex.what() << std::endl;
        }
    }
    */

   //std::nothrow
    for(size_t i{0} ; i < 100 ; ++i){
   
        int * data = new(std::nothrow) int[1000000000];

        if(data!=nullptr){
            std::cout << "Data allocated" << std::endl;
        }else{
            std::cout << "Data allocation failed" << std::endl;
        }
       
    }

    std::cout << "Program ending well" << std::endl;
    
    return 0;
}
```


## 1.7.5 Memory Leaks and Loss of Ownership

This section focuses on **memory leaks caused by losing ownership of dynamically allocated memory**.

A **memory leak** occurs when:
- Memory is allocated on the heap
- The program **loses the pointer to it**
- The memory can no longer be freed

---

### Case 1: Overwriting a Pointer (Lost Allocation)

```{code-block} cpp
int* p_number{new int{67}}; // address1

int number{55}; // stack variable

p_number = &number; // address1 lost → memory leak
```


- `p_number` initially owns heap memory (address1)
- It is reassigned to a stack address (address2)
- The original heap memory is now **unreachable**
- Once the pointer is overwritten, the allocated memory is **impossible to delete**

---

### Case 2: Double Allocation Without Delete

```{code-block} cpp
int* p_number1{new int{55}};

// Missing delete

p_number1 = new int{44}; // previous allocation leaked
```

- First allocation (`55`) is never released
- Pointer is reassigned to new memory
- Old memory becomes **orphaned**

---

### Case 3: Scope Does NOT Free Heap Memory

```{code-block} cpp
{
    int* p_number2{new int{57}};
}
```

- Pointer goes out of scope
- But heap memory **remains allocated**
- Scope only affects **pointer lifetime**, not **heap memory**

---

### Correct Handling Patterns

#### Pattern 1: Delete Before Reassignment

```{code-block} cpp
delete p_number;
p_number = nullptr;

p_number = &number; // now safe
```

---

#### Pattern 2: Delete Before Reallocation

```{code-block} cpp
delete p_number1;
p_number1 = nullptr;

p_number1 = new int{44};
```

---

#### Pattern 3: Always Free Before Leaving Scope

```{code-block} cpp
{
    int* p_number2{new int{57}};

    delete p_number2;
    p_number2 = nullptr;
}
```


Every `new` must have a **matching `delete`**.

If not:
- Memory usage grows over time
- Leads to instability in long-running programs

---

```{code-block} cpp

#include <iostream>

int main() {
  int *p_number{
      new int{67}}; // Points to some address, let's call that address1

  // Should delete and reset here

  int number{55}; // stack variable

  p_number = &number; // Now p_number points to address2 , but address1 is still
                      // in use by our program. But our program has lost access
                      // to that memory location.
                      // Memory has been leaked.

  // Double allocation

  int *p_number1{new int{55}};

  // Use the pointer

  // Should delete and reset here.

  p_number1 = new int{44}; // memory with int{55} leaked.

  delete p_number1;
  p_number1 = nullptr;

  // Nested scopes with dynamically allocated memory
  {
    int *p_number2{new int{57}};

    // Use the dynamic memory
  }
  // Memory with int{57} leaked.

  std::cout << "Program ending well" << std::endl;
  return 0;
}

```

## 1.7.6 Dynamic Arrays and Initialization

This section covers how to allocate, initialize, and safely use **dynamic arrays** on the heap, and contrasts them with **static arrays** on the stack.


### Declaring Dynamic Arrays

```{code-block} cpp
const size_t size{10};

double* p_salaries{new double[size]};              // uninitialized (garbage values)
int* p_students{new(std::nothrow) int[size]{}};    // all elements initialized to 0
double* p_scores{new(std::nothrow) double[size]{1,2,3,4,5}};
```


- `new double[size]`  
  → elements contain **indeterminate values**

- `new int[size]{}`  
  → **value-initialized**, all elements set to `0`

- `new double[size]{1,2,3,4,5}`  
  → first elements initialized, remaining elements set to `0`

---

### Checking Allocation Success

```{code-block} cpp
if(p_scores){
    std::cout << "Successfully allocated memory" << std::endl;
}
```

- Required when using `std::nothrow`
- Prevents dereferencing `nullptr`

---

### Accessing Array Elements

```{code-block} cpp
for(size_t i{}; i < size; ++i){
    std::cout << p_scores[i] << " : " << *(p_scores + i) << std::endl;
}
```

Both are equivalent:

- `p_scores[i]` → array indexing
- `*(p_scores + i)` → pointer arithmetic

---

### Pointer Size vs Array Size

```{code-block} cpp
sizeof(p_scores)
```

- Returns size of the **pointer**, not the array
- Typically:
  - 8 bytes on 64-bit systems
  - 4 bytes on 32-bit systems

---

### Static Arrays (Stack)

```{code-block} cpp
int scores[10]{1,2,3,4,5,6,7,8,9,10};
```

- Stored on the **stack**
- Size known at compile time

```{code-block} cpp
std::cout << std::size(scores) << std::endl;
```

- Works because the compiler knows the array size

---

### Dynamic Arrays (Heap)

```{code-block} cpp
int* p_scores1{new int[10]{1,2,3,4,5,6,7,8,9,10}};
```

- Stored on the **heap**
- Size is **not tracked automatically**

 This will NOT work:

```{code-block} cpp
std::size(p_scores1); //  invalid
```

- `p_scores1` is just a pointer, not an array type
- Dynamic arrays lose size information
- You must **manually track the size**
- Common pattern:

```{code-block} cpp
size_t size{10};
int* data{new int[size]};
```

---

```{code-block} cpp
#include <iostream>

int main(){

    const size_t size{10};
    
    double *p_salaries { new double[size] };
    int *p_students { new(std::nothrow) int[size]{} };
    double *p_scores { new(std::nothrow) double[size]{1,2,3,4,5} };

    if(p_scores){
        std::cout << "size of scores (pointer size): " << sizeof(p_scores) << std::endl;
        std::cout << "Successfully allocated memory for scores."<< std::endl;
        
        for(size_t i{}; i < size ; ++i){
           std::cout << "value : " << p_scores[i]
                     << " : " << *(p_scores + i) << std::endl; 
        }
    }

    delete [] p_salaries;
    p_salaries = nullptr;

    delete [] p_students;
    p_students = nullptr;

    delete [] p_scores;
    p_scores = nullptr;

    std::cout << "=====================================" << std::endl;

    int scores[10] {1,2,3,4,5,6,7,8,9,10};

    std::cout << "scores size : " << std::size(scores) << std::endl;
    for(auto s : scores){
        std::cout << "value : " << s << std::endl;
    }

    int* p_scores1 = new int[10]{1,2,3,4,5,6,7,8,9,10};

    delete[] p_scores1;
    p_scores1 = nullptr;

    return 0;
}
```
