Type Hinting
============

<div class='common'>Common Python</div>

Type hinting should be widely used as appropriate. The community is
still working out where to use, and possibly, where not to use, type
hinting.

TL;DR
-----

Use widely - either as glorified comments where helpful or, where static
checking makes sense (e.g. larger, more complex projects), for everything.

Description
-----------

Hints about the data type of function parameters

Examples
--------

Type hinting allows us to indicate what types a function expects as
arguments and what types it will return. E.g.

```python
def get_greeting(name: str, age: int) -> str:
```

As the name makes clear, type hints are hints only but there are tools
that enable type hinting to be checked and enforced.

Misuses
-------

As clutter in simple code where it doesn't add clarity but detracts from
simplicity and readability.

Links
-----

https://when-of-python.github.io/blog/type-hinting-get-the-hint.html
