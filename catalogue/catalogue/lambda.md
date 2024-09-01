Lambda <a class="status situational">Situational Python</a>
======

TL;DR
-----

Used well, lambdas can simplify code and are perfectly readable; used poorly, and code becames opaque and bug-prone. Although use should be restrained, an accommodation should be made for Pandas and sorting, albeit with caveats to ensure usage doesn't compromise readability.

Description
-----------

Un-named functions, typically very brief.

Example
-------

In pandas:

```python
df.apply(lambda row: row['w'] * row['h'])
```

In sort expressions:

```python
users = sorted(users, key=lambda user: user['name'].lower())
```

Situations
----------

In pandas when the function is very simple and easier to understand by seeing than by its name; or in a sort expression.


Links
-----

https://lean.python.nz/blog/the-when-of-lambda.html
