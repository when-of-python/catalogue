Pickle
======

<div class='deprecated'>Deprecated Python</div>

TL;DR
-----

Avoid (except possibly in distributed computing)

Description
-----------

Python-specific object serialisation.

Example
-------

```python
pets = ['cat', 'dog', 'eel', 'frog']
## Serialise
with open('pets.pkl', 'wb') as f:
    pickle.dump(pets, f)  ## serialise list to file
## Deserialise
with open('pets.pkl', 'rb') as f:
    pets_recovered = pickle.load(f)
```

Status
------

Deprecated Python

Links
-----

https://when-of-python.github.io/blog/pickle-in-a-pickle.html
