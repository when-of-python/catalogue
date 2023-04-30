Match Case (Structural Pattern Matching) <a class="status situational">Situational Python</a>
========================================

TL;DR
-----

Don't use match-case / structural pattern matching in Python unless working with Abstract Syntax Trees or deeply nested JSON - there are always alternatives that are more widely readable and less risky.

Description
-----------

Conditional statement which collects matched data into variables ready to use. More a mini language than a fancy version of the switch statements found in some other languages.

Examples
--------

```python
match len(name):
    case 1:
        print("One behavior")
    case 2:
        print("Two behavior")
    case 3:
        print("Three behavior")
```

Situations
----------

Only potentially worth using when working with special cases like Abstract Syntax Trees and deeply nested JSON.

Links
-----

https://when-of-python.github.io/blog/simple-switch-statement-for-python.html
