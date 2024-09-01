Walrus Operator <a class="status deprecated">Deprecated Python</a>
===============

The walrus operator is very rarely better than the alternatives and its
very rare benefits are outweighed by the cost of adding yet more syntax
and features to the language.

Temporary alternative status:

<a class="status situational">Situational Python</a>

There are rare cases where the walrus operator is better than
alternatives and there is a genuine dispute about whether the benefits
in these cases outweigh the costs of having an additional feature. As we
gain more experience with this feature as a community more of a
consensus may be reached.

TL;DR
-----

Don't use the walrus operator - there are always alternatives.

Description
-----------

In-line assignment to a variable name in an expression

Examples
--------

The Walrus operator is an assignment expression. Normally we assign
values to names with the syntax name = value e.g. fname = 'Zac'. The
Walrus operator allows us to perform assignment as an inline expression
within another statement. For example, instead of:

```python
>> fname = 'Zac'
>> print(fname)
Zac
```

we can save a line by writing:

```python
>> print(f_name := 'Zac')
Zac
```

Situations
----------

Only use for simple comprehensions and only then when it is simple and
avoids an expensive computation. For example:

```python
filtered_list = [res for item in items if (res := slow(item))]
```

Links
-----

https://lean.python.nz/blog/the-walrus-and-the-software-carpenter.html
