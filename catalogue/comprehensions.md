Comprehensions
==============

<div class='common'>Common Python</div>

TL;DR
-----

(Readable) Comprehensions are one of the great features of Python - enjoy.

Description
-----------

A concise, readable way of creating lists, dictionaries, and sets from other sequences.

Examples
--------

```python
>> nums = [1, 2, 3, 4]
>> squares = [num ** 2 for num in nums]
>> print(squares)
[1, 4, 9, 16]
```

```python
>> evens_squared = [num ** 2 for num in nums if num % 2 == 0]
>> print(evens_squared)
[4, 16]
```

```
>> names = [('Charles', 'George'), ('Camilla', 'Shand'), ('Charles',
'Dickens')]
>> unique_fnames = {fname for fname, _lname in names}
>> print(unique_fnames)
{'Camilla', 'Charles'}
```

Misuses
-------

If a comprehension is hard to read, use an alternative instead e.g. a
loop. Comprehensions are good; incomprehensions less so.

Links
-----

https://when-of-python.github.io/blog/comprehensions-are-common-python.html
