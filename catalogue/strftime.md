strftime <a class="status common">Common Python</a>
=======

TL;DR
-----

`strftime` is useful when formatting a date but is redundant when inserting a date into an f-string

Description
-----------

`strftime()` allows us to format a date as a string e.g.

Example
-------

```python
my_date.strftime('%Y-%m-%d')  ## 2027-05-30

my_date.strftime('%d-%m-%Y')  ## 30-05-2027
```

When not to use
---------------

Don't use `strftime` when doing string interpolation unless you are needing to use the formatted string somewhere else as well.

DON'T - unnecessary and inelegant:

```python
date_str = my_date.strftime('%Y-%m-%d')
print(f"The date is {date_str}")
```

DO - less is more - the following is more readable and has fewer moving parts:


```python
print(f"The date is {my_date:%Y-%m-%d}")
```

Links
-----

[String manipulations Python beginners should know](https://www.bitecode.dev/p/string-manipulations-python-beginners)
