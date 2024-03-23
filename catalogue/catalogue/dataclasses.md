Dataclasses <a class="status common">Common Python</a>
===========

TL;DR
-----

Learn dataclasses and use them whenever you need a data structure with clear, self-documenting attributes. Use instead of named tuples.

Description
-----------

Data structure with clear, self-documenting attributes.

Example
-------

```python
@dataclass
class Coord:
    lat: float
    lon: float
    srid: int = 4326
```

```python
@dataclass(frozen=True)
class Data:
    lbl: str
    src: str
    vals: Sequence[float]

    def __post_init__(self):
        ## validate
        if not 10 <= len(self.vals) <= 100:
            raise Exception(f"Must have between 10 and 100 values ({len(self.vals)} supplied)")

    def __str__(self) -> str:
        ## nice representation of data class when printed
        return f"{self.lbl} ({self.lat}, {self.lon}) SRID: {self.srid}"
```

Misuse
------

If you are having to override too much of what a dataclass provides then maybe a plain vanilla class is a better fit.

Links
-----

https://whenof.python.nz/blog/classy-data-with-dataclasses.html
