Dictionaries <a class="status common">Common Python</a>
==============

TL;DR
-----

Dictionaries are a staple data structure in Python - but sometimes dataclasses are a better alternative.

Description
-----------

An efficient data structure mapping unique keys to values. Values can be almost anything but keys must be immutable and hashable. For example, a set cannot be used as a key but a frozenset can. Typically, keys will all be the same type and values will also be of one type.

Examples
--------

```python
>> capitals = {'UK': 'London', 'USA': 'Washington DC', 'NZ': 'Wellington'}
>> capitals['UK']
'London'
>> capitals.get('Canada', 'Unknown')
'Unknown'
```

When not to use
---------------

If you have a fixed set of attributes it can be better to use a dataclass. The benefits of dataclasses in such cases:

* The developer controls which attributes can exist - dictionaries are very flexible but that can make them hard to reason about - code can modify them in almost any way.
* Default values and type hints can be defined easily
* The possible attributes are clearly documented - both by the design of the dataclass and possibly in the class definition itself

```python
>> location = {'latitude': -36, 'longitude': 178, 'srid': 4326}
>> location['longtude'] = 179
>> location
{'latitude': -36, 'longitude': 178, 'srid': 4326, 'longtude': 179}

>> @dataclass(frozen=True)
>> class Location:
>>    latitude: float
>>    longitude: float
>>    srid: int = 4326  ## WGS84
>>
>> location = Location(latitude=-36, longitude=178)
>> 
... dataclasses.FrozenInstanceError: cannot assign to field 'longtude'

It is also easy to add validation to dataclasses e.g. to prevent impossible values for longitude.
```


Links
-----

[The Mighty Dictionary](https://www.youtube.com/watch?v=C4Kc8xzcA68)
[The Dictionary Even Mightier PyCon](https://www.youtube.com/watch?v=66P5FMkWoVU)