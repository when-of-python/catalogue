Lambda
======

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

Status
------

Situational Python

Situations
----------

In pandas when the function is very simple and easier to understand by seeing than by its name; or in a sort expression.

TLDR;
-----

Used well, lambdas can simplify code and are perfectly readable; used poorly, and code becames opaque and bug-prone. Although use should be restrained, an accommodation should be made for Pandas and sorting, albeit with caveats to ensure usage doesn't compromise readability.

Links
-----

https://when-of-python.github.io/blog/the-when-of-lambda.html
