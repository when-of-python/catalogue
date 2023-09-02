Title: Deprecation Appreciation
Date: 2023-09-02 19:00
Category: Python
Tags: deprecated python
Slug: deprecation-appreciation
Authors: Grant Paton-Simpson
Summary: Making a great language is not just about what you include, it is also about what you leave out. As it says in the Zen of Python, "There should be one-- and preferably only one --obvious way to do it." Hard deprecation, where existing functionality breaks, is one approach to shrinking a language so the core can mostly fit in our brain. Soft deprecation is good because it can be exercised more quickly and widely than hard deprecation - there won't be as many unintended consequences or side effects.

Python as a Designed Language
=============================

One of the things I liked when switching from PHP to Python was the way a little learning went further. Once I understood how to perform certain operations with strings e.g. slicing, I also automatically knew how to do the same thing with other sequences. Python basically felt more elegant and designed. Less was more. And it didn't feel like Python had just grown and grown - it felt like it had been designed.

The "designed" feeling is not just about what has been included but also about what is left out. Sometimes different ways of doing the same thing are noise making it harder to learn any of the alternatives properly. As it says in the Zen of Python, "There should be one-- and preferably only one --obvious way to do it."

Reality
=======

In reality, Python has not been able to retain all the elegance of its earliest, smaller and less capable versions. Some good features have been added without others being deprecated, or, at least, explicitly reserved for more specialised use cases - see [Classy Data with Dataclasses](https://whenof.python.nz/blog/classy-data-with-dataclasses.html). Over time, this situation only gets worse unless there is some process of deprecation.

Deprecation
===========

Fortunately, the deprecation process seems to be ramping up, at least for modules. See [PEP 594 – Removing dead batteries from the standard library](https://peps.python.org/pep-0594/) for a discussion of hard deprecations and the planned timetable.[ref]Sometimes there can be a stay of execution. For example, David Beazley argued that the wave module is "easy to teach to kids and can make crazy sounds". According to the PEP, therefore, "it's a fun battery to keep."[/ref] There is also a soft deprecation process [Formalize the concept of “soft deprecation” (don’t schedule removal) in PEP 387 “Backwards Compatibility Policy”](https://discuss.python.org/t/formalize-the-concept-of-soft-deprecation-dont-schedule-removal-in-pep-387-backwards-compatibility-policy/27957). Soft deprecation is good because it can be exercised more quickly and widely than hard deprecation - there won't be as many unintended consequences or side effects.

Deprecated Python
=================

The When Of Python splits Python features into Common Python, Situational Python, and Deprecated Python. Deprecated Python is an especially useful concept because it allows us to shrink Python and better meet the goal of having one obvious way of doing things. Ideally we will deprecate more features in future releases of Python.
