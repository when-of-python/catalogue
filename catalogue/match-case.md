Match Case (Structural Pattern Matching)
========================================

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

Status
------

Situational Python

Situations
----------

Only potentially worth using when working with special cases like Abstract Syntax Trees and deeply nested JSON.

Misuses
-------

Any apart from a few rare cases (e.g. Abstract Syntax Trees, deeply-nested JSON).

TLDR;
-----

Don't use match-case / structural pattern matching in Python unless working with Abstract Syntax Trees or deeply nested JSON - there are always alternatives that are more widely readable and less risky.

Links
-----

https://when-of-python.github.io/blog/simple-switch-statement-for-python.html
