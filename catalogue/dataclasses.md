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
@dataclass
class Data:
    lbl: str
    src: str
    vals: Sequence[float]

    def __post_init__(self):
        ## Validate
        if not 10 <= len(self.vals) <= 100:
            raise Exception(f"Must have between 10 and 100 values ({len(self.vals)} supplied)")
        ## Derived calculations
        self.avg = mean(self.vals)

    def to_summary(self) -> str:
        ...
```

Misuse
------

If you are having to override too much of what a dataclass provides then maybe a plain vanilla class is a better fit.

Links
-----

https://whenof.python.nz/blog/classy-data-with-dataclasses.html
