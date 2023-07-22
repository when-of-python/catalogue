Title: Restrict Struct?
Date: 2023-07-22 10:00
Category: Python
Tags: python, struct, dataclasses, namedtuple
Slug: restrict-struct
Authors: Grant Paton-Simpson
Summary: Adding `struct` to Python is tempting because `struct`s would be better than dataclasses in particular ways. But they would be Yet Another Thing To Learn and Teach. And they aren't worth it in the core language. It is like cluttering up your kitchen with unitasker gadgets like meat claws and egg cubers.

What has your experience of structs in other languages been? Do you agree with this post? Do you disagree? Please comment below.

Introduction
============

Brett Cannon recently proposed adding a struct syntax for Python [Proposing a struct syntax for Python](https://snarky.ca/proposing-a-struct-syntax/).

`struct Point(x: int, y: int)`

Like all his articles it was a fascinating read. And you have to respect someone who talks about Python with friends while doing a vacation road trip :-). But we should strongly resist adding yet more increasingly specialised features to the core language. So let's briefly look at some of the issues raised by the article (directly or indirectly) and possible responses from a When-Of-Python point of view.

Some Arguments
==============

We need an alternative to namedtuple and dataclasses
----------------------------------------------------

There probably are use cases where `struct` is better than `dataclass` but they aren't important enough to add yet another language feature to the core language.

In practice you'd end up needing to know `dataclasses` anyway because sometimes you need mutability. So now you have to teach both rather than teaching just the one and teaching it well.

But we're agreed that it would be a good idea to remove `collections.namedtuple`.

We don't need methods on our data structures
--------------------------------------------

A lot of the time we don't need methods in our data structures. And having methods does add an overhead. But methods are often very useful, especially when wanting to pre-calculate derived values or to validate input (in `dataclasses` most commonly using the __post_init__ method).

And because we will sometimes need `dataclasses` as well as something like a `struct`, we should probably just use `dataclasses` in both cases (with rare exceptions). The same principle applies in cooking. Do you really want to clutter up your kitchen with unitasker gadgets like meat claws and egg cubers. [The 'Unitasker' Kitchen Gadgets Alton Brown Loves To Loathe](https://www.npr.org/sections/thesalt/2015/12/23/460833325/the-unitasker-kitchen-gadgets-alton-brown-loves-to-loathe)

Struct has an elegant syntax
----------------------------

Agreed - when there are only a few attributes:

`struct Point(x: int, y: int)`

But I often find my dataclasses gain additional useful attributes over time and the vertical layout of dataclasses proves really readable - especially when we want type hints, default arguments, and comments:

```python
@dataclass
class Point:
    x: int
    y: int

@dataclass
class Point:
    x: int
    y: int
    srid: int = 4326  # WGS84
```

I also like how you can incrementally boost the robustness as you feel the need e.g.

```python
@dataclass
class Point:
    x: int
    y: int
    srid: int = 4326  # WGS84

    def __post_init__(self):
        if not 173 <= self.x <= 174:
            raise ValueError(f"Out of range x value {self.x}")
```

and add new attributes in a logical order without having to thinking about the order of defaults:

```python
@dataclass(kw_args=True)
class Point:
    lbl: str = 'Unknown'
    x: int
    y: int
    srid: int = 4326  # WGS84

    def __post_init__(self):
        if not 173 <= self.x <= 174:
            raise ValueError(f"Out of range x value {self.x}")
```

Brett acknowledges the problem with adding documentation to `structs`:

> I wish there was a way to do native docstring support while keeping this a single line, but e.g., struct Point(x: int, y: int), "a 2D point." just doesn't look right to me. Since it is a new keyword it might be possible to make a : optional and only usable to add a docstring, but that might be a little too weird when the : doesn't alow for other statements afterwards. Otherwise doing a bare string immediately after the definition could inherently be picked up as a docstring just like what PEP 257 calls an "attribute docstring".

Documentation is another thing `dataclasses` make easy and documentation really matters:

```python
@dataclass
class Point:
    """
    Point for inclusion in standard plots.
    Has validation for country.
    """
    x: int
    y: int
```

Optional typing
---------------

> To be very specific as to why I think this could be better than dataclasses:
>    Typing is optional (there are still folks who don't want to lean into that and it simply isn't always necessary)


In practice I usually have very primitive data types in my `dataclasses` like `str` or `int` (or other `dataclasses` or `enum.StrEnums`) but even if you don't want to think about typing, `dataclasses` accept `...` and `typing.Any` e.g.

```python
@dataclass
class Point:
    x: ...
    y: ...
```

More details and options can be found at [death and gravity: Dataclasses without type annotations](https://death.andgravity.com/dataclasses)

Performance
-----------

> Class construction should be faster (which intuitively you would think shouldn't matter, but I have talked to folks where this is an actual concern, especially when startup time is critical)

In cases where raw performance really matters we should consider another solution rather than adding something to the core Python language which we'll then have to teach as well as all the existing content.

Misc
----

> Syntax typically leads to better tooling support since there's no ambiguity

True - especially with tools like mypy - but those tools will be forced to handle `dataclasses` well at some point so ...

> Easier to teach than (data)classes, so can act as a stepping stone towards classes

But you're going to have to teach `dataclasses` anyway so why add teaching `structs` to that as well.

> Better semantics than dataclasses have by default (at least in my opinion 😁)

Maybe, maybe not - but people will have to learn both so better to become confident with one - and then really learn it well.

Conclusion
==========

Adding `struct` to Python is tempting because `struct`s would be better than dataclasses in particular ways. But they would be Yet Another Thing To Learn and Teach. And they aren't worth it in the core language. It is like cluttering up your kitchen with unitasker gadgets like meat claws and egg cubers.

