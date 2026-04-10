# 1.4 Flow Control
## 1.4.1 The `if` Statement

The `if` statement controls program flow by conditionally executing a block of code.

```cpp
if (condition) {
    // executed only if condition is true
}
```

If `condition` evaluates to `true`, the block executes.  
If `false`, it is skipped.

To define two mutually exclusive execution paths:

```cpp
if (condition) {
    // executes when condition is true
} else {
    // executes when condition is false
}
```

Exactly **one** branch executes.


**Nested `if`**

An `if` statement may appear inside another:

```cpp
if (green) {
    if (police_stop) {
        std::cout << "Stop" << std::endl;
    } else {
        std::cout << "Go" << std::endl;
    }
}
```

Nested `if` increases logical depth.  


```cpp
if (green && !police_stop) {
    std::cout << "Go" << std::endl;
} else {
    std::cout << "Stop" << std::endl;
}
```

Prefer combining conditions or restructuring logic when possible.
```{code-block} cpp
#include <iostream>

int main() {
  // Two integer values to compare
  int n1{55};
  int n2{60};

  // Relational expression produces a boolean result
  bool result = (n1 < n2);

  // std::boolalpha forces textual output: true / false instead of 1 / 0
  std::cout << std::boolalpha 
            << "result: " << result << std::endl;

  std::cout << std::endl;
  std::cout << "Free standing If statement" << std::endl;

  // Independent if statement:
  // This block executes only if result is true.
  if (result == true) {
    std::cout << n1 << " is less than " << n2 << std::endl;
  }

  // Logical negation using !
  // Executes only if result is false.
  if (!(result == true)) {
    std::cout << n1 << " is NOT less than " << n2 << std::endl;
  }

  // Using else: guarantees exactly one branch executes
  std::cout << std::endl;
  std::cout << "Using the else clause:" << std::endl;

  // Idiomatic form: directly use the boolean variable
  if (result) {
    std::cout << n1 << " is less than " << n2 << std::endl;
  } else {
    std::cout << n1 << " is NOT less than " << n2 << std::endl;
  }

  // Using the relational expression directly as the condition
  std::cout << std::endl;
  std::cout << "Using expression as condition:" << std::endl;

  if (n1 < n2) {
    std::cout << n1 << " is less than " << n2 << std::endl;
  } else {
    std::cout << n1 << " is NOT less than " << n2 << std::endl;
  }

  // Example of independent conditional checks (not mutually exclusive)
  std::cout << std::endl;
  std::cout << "Multiple independent conditions" << std::endl;

  bool red{false};
  bool green{true};
  bool yellow{false};
  bool police_stop{false};

  // Each condition is evaluated separately
  if (red) {
    std::cout << "Stop" << std::endl;
  }
  if (yellow) {
    std::cout << "Slow Down" << std::endl;
  }
  if (green) {
    std::cout << "Go" << std::endl;
  }

  // Nested conditional logic:
  // The inner condition is evaluated only if the outer one is true.
  std::cout << std::endl;
  std::cout << "Police officer stops (verbose nesting)" << std::endl;

  if (green) {               // First condition
    if (police_stop) {       // Second condition
      std::cout << "Stop" << std::endl;
    } else {
      std::cout << "Go" << std::endl;
    }
  }

  std::cout << std::endl;
  std::cout << "Police officer stops (combined conditions)" << std::endl;

  // Equivalent logic using logical AND (&&)
  // Both conditions must be true to execute the first branch
  if (green && !police_stop) {
    std::cout << "Go" << std::endl;
  } else {
    std::cout << "Stop" << std::endl;
  }

  return 0;
}
```


## 1.4.2 Multi-Branch Decision Making with `if / else if`

In C++, an `if / else if` chain allows a program to **select one action among multiple possible conditions**.

Each condition is evaluated **sequentially from top to bottom**.  
As soon as one condition evaluates to `true`, its block executes and the rest of the chain is **skipped**.

This pattern is commonly used when a variable represents a **state, mode, or selection**, such as the currently active tool in a drawing program.


```{code-block} cpp
#include <iostream>

// Tools
const int Pen{10};
const int Marker{20};
const int Eraser{30};
const int Rectangle{40};
const int Circle{50};
const int Ellipse{60};

int main() {

  int tool{Circle};

  if (tool == Pen) {
    std::cout << "Active tool is pen" << std::endl;
    // Do the actual painting
  } else if (tool == Marker) {
    std::cout << "Active tool is Marker" << std::endl;
  } else if (tool == Eraser) {
    std::cout << "Active tool is Eraser" << std::endl;
  } else if (tool == Rectangle) {
    std::cout << "Active tool is Rectangle" << std::endl;
  } else if (tool == Circle) {
    std::cout << "Active tool is Circle" << std::endl;
  } else if (tool == Ellipse) {
    std::cout << "Active tool is Ellipse" << std::endl;
  }

  std::cout << "Moving on" << std::endl;

  return 0;
}
```

If `tool` is initialized as:

```cpp
int tool{Circle};
```

The program checks conditions in this order:

1. `tool == Pen` → false  
2. `tool == Marker` → false  
3. `tool == Eraser` → false  
4. `tool == Rectangle` → false  
5. `tool == Circle` → **true → executes this block**

After this, the remaining conditions are **skipped**, and execution continues with the rest of the program.

Although the constants used in this example are **integers**, the `if` statement does **not require integers specifically**.

In C++, the condition inside an `if` must be an **expression that evaluates to a boolean value**.

This means the condition can come from:

- A **boolean variable**
- A **comparison expression** (`==`, `<`, `>`, etc.)
- A **numeric value** (`0` is interpreted as `false`, any non-zero value as `true`)

in modern C++ it is more common to represent this kind of fixed set of options using an `enum` (enumeration), which provides better type safety and clearer semantics.

Enumerations will be introduced later in the documentation.


## 1.4.3 Switch Statement

The `switch` statement is used to select **one execution path among multiple alternatives** based on the value of an expression.  
It is often cleaner and easier to read than long chains of `if-else if` statements when comparing the **same variable against multiple constant values**.

The `switch` evaluates an expression once and compares the result against different `case` labels.  
If a match is found, the corresponding block of code executes.

**Note**
- `switch` evaluates a **single expression**.
- Each `case` represents a **possible value** of that expression.
- The `break` statement prevents **fall-through** to the next case.
- Multiple cases can share the **same block of code**.
- `default` runs if **no case matches**.
- The expression in `switch` must be an **integral type** (`int`, `char`, etc.) or an **enumeration (`enum`)**.
- `switch` **cannot operate on `std::string`** or floating-point types.
- In this example the tools are represented as **integer constants**.  
Later in the documentation, we will introduce **`enum` (enumerations)**, which are a safer and clearer way to represent a **fixed set of possible values** like these tools.

```{code-block} cpp
#include <iostream>
#include <string>

// Tools represented as integer constants
const int Pen{10};
const int Marker{20};
const int Eraser{30};
const int Rectangle{40};
const int Circle{50};
const int Ellipse{60};

int main(){

    int tool {Eraser};

    switch (tool)
    {
        case Pen : {
             std::cout << "Active tool is Pen" << std::endl;
        }
        break;

        case Marker : {
             std::cout << "Active tool is Marker" << std::endl;
        }
        break;

        // Multiple cases sharing the same block
        case Eraser :
        case Rectangle :
        case Circle : {
             std::cout << "Drawing Shapes" << std::endl;
        }
        break;

        case Ellipse : {
             std::cout << "Active tool is Ellipse" << std::endl;
        }
        break;

        // Executed if no case matches
        default: {
            std::cout << "No match found" << std::endl;
        }
        break;
    }

    std::cout << "Moving on" << std::endl;

    /*
    // The switch expression must be an integral type or enum.
    // Using std::string will produce a compilation error.

    std::string name {"John"};

    switch (name) // Compiler error!
    {

    }
    */

    return 0;
}
```


## 1.4.4 Ternary Conditional Operator

The **ternary operator (`?:`)** provides a compact way to perform a conditional assignment.  
It is often used as a **shorter alternative to an `if-else` statement** when selecting between two values.

The operator evaluates a **condition** and returns one of two expressions depending on whether the condition is `true` or `false`.

`condition ? expression_if_true : expression_if_false`


**Notes**

- The ternary operator evaluates a **boolean condition**.
- If the condition is **true**, the first expression is returned.
- If the condition is **false**, the second expression is returned.
- It is commonly used for **simple assignments**.
- For more complex logic, a regular **`if-else` statement** is usually clearer.


```{code-block} cpp
#include <iostream>

int main(int argc, char *argv[]) {

  int a{10};
  int b{20};

  /*
    Equivalent logic using if-else:

    int max;

    if(a > b){
        max = a;
    }else{
        max = b;
    }
  */

  // Ternary operator used to select the larger value
  int max{ (a > b) ? a : b };

  std::cout << "max: " << max << std::endl;

  return 0;
}
