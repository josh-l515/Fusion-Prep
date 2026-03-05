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
