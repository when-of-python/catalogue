Pickle
======

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

TLDR;
-----

Avoid (except possibly in distributed computing)

Links
-----

https://when-of-python.github.io/blog/pickle-in-a-pickle.html
