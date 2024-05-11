Title: Assert Assertions
Date: 2024-05-11 13:00
Category: Python
Tags: python, assert, testing
Slug: assert-assertions
Authors: Grant Paton-Simpson
Summary: The `assert` statement makes it easy to set up tests in pytest. Outside of the testing context, the best (simplified) advice is to avoid them. In many cases either exceptions or comments are better.

What has your experience of `assert` been? Do you agree with this post? Do you disagree? Please comment below.

Introduction
============

The `assert` statement enables us to state something which we require to be true. We can also include a comment to display should the assertion fail. For example:

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

In this case, as long as `assert`s haven't been deactivated (through the use of the -O optimise option), the program will halt when we pass -3 to the get_square function.

```bash
The square of 12 is 144
...
AssertionError: num should be greater than 0 but was -3
```

If we run our script with the -O option then the program will accept the -3 value and output the following:

```bash
The square of 12 is 144
The square of -3 is 9
The square of 666 is 443,556
```

(Simplified) Guidance
=====================

1) With rare exceptions we should only use `assert`s in unit tests e.g. when using pytest

2) We shouldn't use `assert`s as comments or documentation - we should write actual comments in readable English

3) If we want to program defensively then we should use exceptions rather than `assert`s (which can be just switched off, even if this is rare in practice)

4) We shouldn't use `assert`s to check for (currently) impossible values. So instead of:

```python
if value == MyEnum.SPAM:
   ...
elif value == MyEnum.EGG:
   ...
else:
    assert False, f"Unexpected {value=}" # This can never happen if we've checked all the cases in the Enum
```
we should write:

``` python
if value == MyEnum.SPAM:
   ...
elif value == MyEnum.EGG:
   ...
else:
    raise ValueError(f"Unexpected {value=}") # This can never happen if we've checked all the cases in the Enum
```
Why? Because it allows us to simplify the basic guidance on using `assert` - all things being equal we should reduce the complexity of our code and the things we have to learn or teach. Furthermore, there is no point worrying about the performance cost of an exception vs an `assert` (assuming it is deactivated using -O flag) in this case - the exception will presumably only ever be raised once before the bug is found and fixed.

5) There are special cases where we might want to use assertions outside of unit tests. Simple guidance doesn't have to cover these. Examples of special cases that can be ignored in simple / simplified guidance:

* While teaching how to program so students can self-test their code with `assert`s you provide

* To assist type checkers handle unreachable code. Note - we could just use an exception there as well.

* Using something like `assert my_value is not None` etc to keep mypy happy

* Avoiding the overhead of exception raising in extremely performance-sensitive code (although why are we using Python in that case?)

* When debugging code


Warning
=======

Don't wrap `assert` in parentheses if you have a comment. Surprisingly, they cease to operate! For example:

```python
assert 1 == 0  ## will fail
assert (1 == 0)  ## will fail
assert 1 == 0, "1 doesn't equal 0"  ## will fail
## but
assert(1 == 0, "1 doesn't equal 0")  ## will pass
```
