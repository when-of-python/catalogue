len <a class="status common">Common Python</a>
===

TL;DR
-----

The len() function is perfect for getting length - but it shouldn't be used for unnecessary calculations to enable simple iteration or to check for emptiness - there are better ways to do that.

Description
-----------

Python's function for getting length.

Example
-------

```python
pets = ['cat', 'rabbit', 'goldfish', 'python']
n_pets = len(pets)
```

When not to use
---------------

When you're using it to enable iteration. Instead of:

```python
pets = ['cat', 'rabbit', 'goldfish', 'python']
for i in range(len(pets)):
    print(pets[i])
```

we should write the more pythonic:

```python
for pet in pets:
    print(pet)
```

We should also avoid using len() to evaluate emptiness. Instead of:

```python
if len(pets) == 0:
```

we should write the more pythonic:

```python
if not pets:
```

Links
-----

https://www.bitecode.dev/i/139716011/too-much-len
