Title: The Challenge of Simplicity
Date: 2023-09-22 08:50
Category: Python
Tags: python, simplicity, complexity, zen of python
Slug: the-challenge-of-simplicity
Authors: Grant Paton-Simpson
Summary: The core goal of the When of Python is to simplify the language so it is as elegant as possible and fits within our brain. The challenge is that, as Python continues to grow in popularity, the language will end up being used in almost every imaginable situation. In which case there will need to be lots of simplifying constructs specific to each situation. As Christopher Neugebauer pointed out in his Kiwi Pycon talk "The Complexity of Simplicity", there will always be complexity so the only question is where it gets handled. Either Python requires users to build complex tools out of simple components, or it provides simple constructs that fit specific situations e.g. for matrix multiplication, or for asynchronous processing. So to stay simple, the Python ecosystem will need to become more complex. Or, to put it another way, situational simplicity means more Python. Having said that, the core language _can_ stay simple and we should keep trying to slim down and refine Common Python.

The Ongoing Spread of Python
----------------------------

Python continues to grow in popularity and it is quite possible that Python will eventually _be_ programming. In my Kiwi PyCon 2023 lightning talk I predicted that this will be the case by 2045 i.e. in about two decades. Not in the sense that other languages won't exist, or that other languages won't be important - but in the sense that nearly all programmers will know Python in addition to any other languages. The assumption behind this prediction is that Python will be aggressively refined and improved as it becomes more important and that these refinements will further increase adoption.

Should this prediction be correct, Python, including Python derivatives such as Mojo and PyPy (and new languages based on Python which don't even exist yet), will be used for even more situations. And these situations will be complex in new ways. As Christopher Neugebauer pointed out in his Kiwi Pycon talk "The Complexity of Simplicity", we can take complexity as given so the only question is where it gets handled. Either Python requires users to build complex tools out of simple components, or it provides simple constructs that fit specific situations e.g. matrix multiplication, or asynchronous processing.

Everything Needs a Simple Interface
-----------------------------------

The question is whether the new interfaces require any changes to the core language or not. An example of a change to the core language is the addition in 2015 of the "@" operator. The operator was added in Python 3.5 to enable matrix multiplication [PEP 465 - A dedicated infix operator for matrix multiplication](https://docs.python.org/3/whatsnew/3.5.html#pep-465-a-dedicated-infix-operator-for-matrix-multiplication). But these cases are rare and the situations for which they are appropriate, and inappropriate, should be clearly communicated when they are introduced. Much more common is the creation of specialist libraries with their own syntax e.g. pandas, polars etc. These can come and go while the core language remains unaffected. So there is no reason to expect that Common Python will have to expand significantly to cope with increasing situational demands.

There Will be More Python
-------------------------

The end result will possibly be a core, Common Python very similar to what we have now; an ecosystem of Python-like languages (some optimised for speed); and a large array of specialist libraries covering almost every imaginable programming task. No individual will be able to understand all of it. But we should all be able to understand Common Python and the Situational Python we regularly use.

It doesn't seem out-of-order to suggest that we slim down and refine Common Python just because there will be an ever-expanding Situational Python. Admittedly, maintaining simplicity at the same time as adding new complexity will require self-discipline but Python has a good track record in this regard. While staying simple isn't always simple, it is a realistic goal.
