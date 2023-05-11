Logical Operators <a class="status common">Common Python</a>
=================

TL;DR
-----

Python's logical operators `and`, `or`, and `not` are basic Python. Sometimes `any` or `all` (and `not any` and `not all`) are better alternatives.

Description
-----------

Python's operators for logical expressions.

Example
-------

```python
good_hire = clever and hardworking and not (dishonest or antisocial)
```

When not to use
---------------

When there are lots of items in the logical equation, or when the number of items in the expression varies. For example, rather than:

```python
if (name_errors or class_errors or logic_errors or syntax_errors):
    print("Something is wrong")
```

we could write:

```python
errors = [name_errors, class_errors, logic_errors, syntax_errors]
if any(errors):
    print("Something is wrong")
```

It is also easy to flip the logic in a readable way:

```python
if not any(errors):
    print("All good :-)")
```

And instead of:

```python
if name_check and class_check and logic_check and syntax_check:
    print("All checks passed")
if not (name_check and class_check and logic_check and syntax_check):
    print("At least one check failed!")
```

we could write:

```python
checks = [name_check, class_check, logic_check, syntax_check]
if all(checks):
    print("All checks passed")
if not all(checks):
    print("At least one check failed!")
```

and we can easily add extra items without having to rewrite the code:

```python
checks.extend([consistency_check, performance_check])
if all(checks):
    print("All checks passed")
```
