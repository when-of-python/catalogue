assert <a class="status common">Common Python</a>
======

TL;DR
-----

Use `assert` for testing e.g. in pytest.

Description
-----------

How we define what will happen under different conditions in Python using `if`, `elif`, and `else`.

Example
-------

```python
def get_square(num: float) -> float:
    assert num > 0, f"num should be greater than 0 but was {num:,}"
    square = num ** 2
    print(f"The square of {num} is {square:,}")
    return square

get_square(12)
get_square(-3)
get_square(666)
```

When not to use
---------------

Outside of testing e.g. instead of an exception or a doc string

Warning
-------
Don't wrap `assert` in parentheses if you have a comment. Surprisingly, they cease to operate! For example:

```python
assert 1 == 0  ## will fail
assert (1 == 0)  ## will fail
assert 1 == 0, "1 doesn't equal 0"  ## will fail
## but
assert(1 == 0, "1 doesn't equal 0")  ## will pass
```

Status
------

Common Python
