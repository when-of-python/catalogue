Title: String Theory
Date: 2024-04-21 07:00
Category: Python
Tags: python, string, interpolation, concatenation, f-strings
Slug: string-theory
Authors: Grant Paton-Simpson
Summary: Python has multiple ways of working with strings depending on the task. For inserting strings into other strings, f-strings are the preferred solution, and it is worth learning a few techniques for zero padding, displaying numbers with thousand separators, percentages, and dates.

What has your experience of working with strings, especially f-strings, been? Do you agree with this post? Do you disagree? Please comment below.

Concatenation, Gluing, and Interpolation 
========================================

Concatenation is one of the first ways we learn of joining strings together in Python, and it remains useful for simple cases, even when we learn about more sophisticated alternatives:

```python
fname = 'Jo'
print('Hello ' + fname)

```

'Hello Jo'

Glueing, or joining strings together with a glue string, is especially useful when working with a sequence of items we wish to present together:

```python
print(' \N{WHITE HEART} '.join(['Romeo', 'Juliet']))
```

'Romeo 🤍 Juliet'

In version 3.6, Python introduced formatted string literals, better known as f-strings. These make it possible to inject, or interpolate, other strings inside a larger string(<ref>or expressions resulting in strings, or anything which has a \_\_str\_\_ method</ref>). f-strings are more readable than the alternative approaches Python had used earlier - namely sprint and the format method.

```python
## sprint
fname = 'Elon'
print("Hello %s" % fname)
```

'Hello Elon'

```python
lname = 'Musk'
print("Hello %s %s" % (fname, lname))
```

'Hello Elon Musk'

```python
## format
print("Hello {fname} {lname}".format(fname=fname, lname=lname))
print("{unit_id:0>10}".format(unit_id="ABC1234"))  ## just showing how powerful the format method can become
```

'Hello Elon Musk'

'000ABC1234'

```python
## f-string
fname = 'Elon'
lname = 'Musk'
print(f"{fname} {lname}")
```

'Elon Musk'

When Not to Use f-string Interpolation
======================================

The first question is whether interpolation should be used at all. Sometimes there is a more elegant solution using string methods.

```python
word = 'crocodile'

## f-string overkill
print(f"{word:*^30}")

## semantic string method
print(word.center(30, '*'))
```

'\*\*\*\*\*\*\*\*\*\*crocodile\*\*\*\*\*\*\*\*\*\*\*'

'\*\*\*\*\*\*\*\*\*\*crocodile\*\*\*\*\*\*\*\*\*\*\*'

In other cases interpolation of any sort is not a good idea from a security point of view. If strings are being built from variables which in any way come from user input they open up vulnerabilities like SQL injection attacks. Here is the warning from the older psycopg docs: “Never, never, NEVER use Python string concatenation (+) or string parameters interpolation (%) to pass variables to a SQL query string. Not even at gunpoint.” And in newer documentation it says:

> Don’t manually merge values to a query: hackers from a foreign country will break into your computer and steal not only your disks, but also your cds, leaving you only with the three most embarrassing records you ever bought. On cassette tapes.
> If you use the % operator to merge values to a query, con artists will seduce your cat, who will run away taking your credit card and your sunglasses with them.
> If you use + to merge a textual value to a string, bad guys in balaclava will find their way to your fridge, drink all your beer, and leave your toilet seat up and your toilet paper in the wrong orientation.
> You don’t want to manually merge values to a query: use the provided methods instead. [Passing parameters to SQL queries](https://www.psycopg.org/psycopg3/docs/basic/params.html)

Even if interpolation is appropriate, it will sometimes be best to use an alternative to f-strings. The main situation in which it makes sense to use sprint or the format method instead is when the main string contains lots of curly braces and it is inefficient to escape all of them. And template strings might be best for untrusted user input [Python String Formatting Best Practices](https://realpython.com/python-string-formatting/#4-template-strings-standard-library)


f-string Tips (Format Strings)
==============================

f-strings have a mini formatting language. Here are four useful tricks (for more, see [Python F-String Codes I Use Every Day](https://pybit.es/articles/python-f-string-codes-i-use-every-day/)
):

Zero-Padding
------------

```python
a = 12345
print(f"{a:0>10}")
```

'0000012345'

Commas in Numbers
-----------------

```python
print(f"{a:,}")
```

'12,345'

Percentages
-----------

```python
num = 0.5
print(f"{num:.0%}")
```

'50%'

Dates
-----

```python
from datetime import datetime
print(f"{datetime.today():%Y-%m-%d}")
```

'2024-04-21'
