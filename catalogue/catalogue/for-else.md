For else <a class="status deprecated">Deprecated Python</a>
========

TL;DR
-----

Don't use - it confuses lots of programmers and there are much more readable alternatives using ```if else```.

Description
-----------

An optional `else` clause in an `for`-loop that will be executed after the end of the loop if a `break` statement is never executed in the loop's body.

Example
-------

```python
for animal in animals:
    if animal == my_pet:
        break
else:
    print("No pet is found :-(")
```

Status
------

Deprecated Python

Links
-----

https://whenof.python.nz/blog/deprecate-for-else-or-else.html
