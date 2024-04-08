Dataclasses Considered Sweet
============================

Overview
--------

Dataclasses are versatile and a crucial part of Python.

Firstly, dataclasses are a great data structure. They enable us to store multiple values in a customised and clearly defined structure. Alongside lists and dictionaries, dataclasses are a valuable fundamental building block in our Python programs.

Secondly, dataclasses are a super-convenient way of defining (most) classes, not just data classes. In addition to removing a whole lot of boilerplate every time, they provide a very readable definition of the (instance) attributes in a class.

These benefits do come with a cost though, and these costs will need to be mitigated.

There will also need to be guidance on when to use a dataclass and when to use a standard class.

Dataclasses as Foundational Data Structures
-------------------------------------------

The more complex a program, the more we benefit from making the meaning of the different parts of the program explicit. We do this by giving things names. So we often shift from data structures that are positional only to those that rely on keywords. We might shift, for example, from tuples to named tuples, or from lists to dictionaries. This is where dataclasses really shine. Even though dataclasses can do much, much more, in their simplest version they provide a very concise, readable syntax for defining a data structure that names its internal parts and, at a basic level, documents them.

For example:

@dataclass
class Coord:
    lbl: str
    lat: float
    lon: float
    srid: int = 4326

There is very little boilerplate and it is hard to think of a more concise way of defining attributes. If we get an instance of a Coord class in our program we know exactly what we're getting and we can refer to parts of it by name. We can also look up the definition of the dataclass to see if there is extra documentation. I recently saw a student using a list as a data structure for configuration and his code became increasingly confusing as he changed the number, type, and order of the items. Items were read from the list by position and it was therefore difficult to read the code for correctness.

As mentioned in the Overview, dataclasses can be used as a convenient way of making classes in general, not just data-centric classes. But even when we are using our dataclass exclusively as a data structure, there are lots of general class features we can add that make the data structure safer, and more convenient to use. Note - dataclasses are worth using as data structures even when kept very simple - don't be deterred by all the extra things you need to understand to strengthen your dataclass. 

We can add derived values as properties - for example:

@dataclass
class Area:
    h_metres: float
    w_metres: float
    lbl: str | None = None

    @property
    def h_cm(self):
        return self.h_metres * 100

    @property
    def area_sq_metres(self):
        return self.h_metres * self.w_metres

We can add validation using the dataclass-supported __post_init__ method:

    def __post_init__(self):
        if not 1 <= self.h_metres <= 100:
            raise ValueError(f"h_metres value ({self.h_metres}) not in expected range")

We can make a nice representation of dataclass objects when printed e.g. in log files or error messages:

    def __str__(self):
      return f"Area {self.h_metres}m x {self.w_metres}m ({self.area_sq_metres:,} square metres)"

We can potentially handle default values. Depending on what we are trying to do there are different strategies. In ascending order of trickiness we have:

1) equals e.g.

@dataclass
class Business:
    ...
    country: str = 'NZ'

2) using __post_init__, where we have access to all the values in the dataclass (including any defined by property) e.g.

    def __post_init__(self):
        if self.lbl is None:
            self.lbl = f"{self.name} (auto-generated)"

This seems to be the best (only?) way of working with other instance attribute values. See https://stackoverflow.com/questions/66437553/reference-a-variable-of-a-dataclass-in-a-field-with-a-default-factory

3) default_factory for a fresh mutable (one that isn't shared by all instances of the class)

from dataclasses import dataclass, field

class Business:
    ...
    branches: list = field(default_factory=[])

4) default_factory for a function

from uuid import uuid4

class Business:
    ...
    user_id: str = field(default_factory = lambda : str(uuid4()))

Finally, we can add convenience functions for ingesting or exporting data - for example, in the case of a Coord object we might make it easy to write something like:

new_coord = coord.with_new_srid(srid=2193)

Whether we make a simple dataclass, or a more sophisticated one, having a well-named data structure makes it much easier to define interface expectations in the program. Basically, what does a function require as an argument and what will it return as a result. Dataclasses make it easy to just use a name in type hinting that is self-explanatory e.g. without even having to look at the code we might reasonably infer that an instance of an OutputSpec dataclass defines the configuration for our output. And if we want to know what aspects of the output are configured we can just look at the dataclass definition for OutputSpec.

Dataclasses as Syntactic Sugar
------------------------------

Dataclasses provide some syntactic sugar by replacing:

class Coord:

    def __init__(self, lbl: str, lat: float, lon: float, srid: int = 4326):
        self.lbl = lbl
        self.lat = lat
        self.lon = lon
        self.srid = srid

with:

@dataclass
class Coord:
    lbl: str
    lat: float
    lon: float
    srid: int = 4326

The best bit is the removal of all the repetitive boilerplate self.x = x etc. And the code is more declarative - in most cases it is very easy to see what attributes will be in the class.

Sweet Enough?
-------------

There is a dark side to dataclasses though - the dataclass decorator makes a series of "magic" changes to your standard class - not least of all the behind-the-scenes transformation of class attributes into instance attributes. The main downside is that people might become confused about the syntax for defining class versus instance attributes and accidentally add class attributes to standard classes. This is already happening in the wild. And Python generally favours explicit over implicit as per The Zen of Python.

The question is - do the benefits of dataclasses outweigh the costs? In the case of data-centric classes, where classes are used as data structures alongside dictionaries and lists and so on, the answer is Yes. In practice, the declarative nature of the dataclass, the ability to flexibly handle default values using fields etc, is so valuable it is worth potential confusion about ways of declaring class versus instance attributes. But what about other uses of dataclasses? Is it worth the rather modest convenience of reducing boilerplate?

To be honest, I'm not sure. My suspicion is that the syntactic sugar of the dataclass is sufficiently sweet that we'll see lots of uses in the wild beyond usage as a data structure. I have already encountered one dev team that mainly uses dataclasses for all class use. In short, the community will decide. But a practical rule-of-thumb might be - use a dataclass unless you find yourself overriding lots of the magic, in which case, a standard Python class will be more explicit. Hacking something that is already magic sounds like a recipe for mysterious behaviours, increased mental load, and subtle bugs.

On a final note, if people are commonly going to use dataclasses as generic classes, it is especially important that Python teachers and resources clarify the difference between a class attribute and and instance attribute. Different languages handle this in different ways which only adds to the potential for confusion.

Normal class:

class Business:
    counter = 0  ## <======= class attribute shared by all instances

    def __init__(self, name: str):
        self.name = name  ## <======= instance attribute unique to an instance

@dataclass
class Business:
    name: str  ## <======= instance attribute (once decorator does its magic)

