if else <a class="status common">Common Python</a>
========

TL;DR
-----

Use `if`-`elif`-`else` for conditional logic unless a dictionary makes better sense.

Description
-----------

How we define what will happen under different conditions in Python using `if`, `elif`, and `else`.

Example
-------

```python
if weather == 'sunny':
    go_cycling()
elif weather == 'rainy':
    watch_movie()
else:
    tidy_house()
```

When not to use
---------------

If there are lots of mappings from similar conditions it might be more practical to use a dictionary. So instead of:

```python
if animal == 'Dog':
    sound = 'Woof'
elif animal == 'Cat':
    sound = 'Meow'
elif animal == 'Budgie':
    sound = 'Cheep'
...
elif animal == 'Horse':
    sound = 'Neigh'
```

we might use the more compressed and maintainable approach:

```python
sounds = {
    'Dog': 'Woof',
    'Cat': 'Meow',
    'Budgie': 'Cheep',
    ...
    'Horse': 'Neigh'
}
sound = sounds[animal]
```

We might even store such mappings in a config file or JSON etc.

It might be thought we can avoid using `else` in circumstances where it is logically impossible to have an else condition but that is probably not a good idea if the logic might change in the future. For example, it might currently be the case that age is either 'young' or 'adult' but adding an "impossible" `else` and raising an exception will alert us in the future if another category e.g. 'senior' is added later.

```python
## currently only two ages in system so else currently logically impossible
if age == 'young':
    send_to_school()
elif age == 'adult':
    send_to_work()
else:
    raise ValueError(f"Unexpected age '{age}'")
```

It might also be thought that we can avoid `else` when there is no affect on the logical flow but sometimes we should use `else` to avoid misleading the reader as to the relative significance of the alternatives. See [Unnecessary else statements](https://www.pythonmorsels.com/unnecessary-else-statements/)


Status
------

Common Python



