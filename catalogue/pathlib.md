pathlib <a class="status common">Common Python</a>
=======

TL;DR
-----

`pathlib` is the best way of working with paths in Python. Alternatives should only be used in cases where squeezing out every little drop of performance is required.

Description
-----------

A library making it easy to work with paths whatever the operating system. The library lets you create paths, find parents, iterate through paths, split out parts of paths e.g. suffixes, and much more.

Examples
--------

```python
>> from pathlib import Path
>> root = Path('/home/g/demo')
>> fpath = root / 'subfolder' / 'my_module.py'
>> print(fpath.suffix)
.py
>> print(fpath.parent)
/home/g/demo/subfolder
```

When not to use
---------------

When performance is absolutely critical

Links
-----

https://switowski.com/blog/pathlib/