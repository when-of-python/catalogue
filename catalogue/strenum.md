StrEnum
=======

<div class='common'>Common Python</div>

TL;DR
-----

StrEnum is a very useful feature especially for strings we want to control as developer, sometimes in collections that cover available options.

Description
-----------

Developer-controlled collections of strings.

Example
-------

```python
from enum import StrEnum

class City(StrEnum):
    AUCKLAND = 'Auckland'
    WELLINGTON = 'Wellington'
    CHRISTCHURCH = 'Christchurch'
    DUNEDIN = 'Dunedin'
```

We can then refer to individual cities using dot notation e.g.

```python
if city == City.AUCKLAND:
    pass
```

The following is True:

```python
'Auckland' == City.AUCKLAND
```

We can also combine our StrEnum nicely with type hinting to clarify what sorts of strings we expect to receive in a function:

```python
def arrange_travel(city: City):
    ...
```

This is arguably better than:

```python
def arrange_travel(city: str):
    ...
```

because it provides clear guidance about the type of inputs expected.

StrEnums also play nicely in other contexts - for example, as dictionary keys. The following works:

```python
city_popns = {
    City.AUCKLAND: 1_571_700,
    City.WELLINGTON: 202_700,
    City.CHRISTCHURCH: 369_000,
    City.DUNEDIN: 126_300,
}
## Both return 1_571_700
city_popns[City.AUCKLAND]
city_popns['Auckland']
```

Links
-----

https://when-of-python.github.io/blog/walrus-hunting-with-strenum.html
