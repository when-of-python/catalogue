Title: Simple Async
Date: 2023-09-24 14:00
Category: Python
Tags: python, async, futures, simplicity
Slug: simple-async
Authors: Grant Paton-Simpson
Summary: Python has multiple solutions for asynchronous programming - each with its own strengths and weakness. In many cases, people reach for a much more complicated solution than is actually needed forgetting the simple pool executors in the batteries-included concurrent futures library. Guidance is needed in this area so people avoid over-engineering and unnecessary complexity.

Asynchronous Programming
------------------------

Being able to achieve tasks at the same time (asynchronously) instead of one-after-the-other (synchronously) can significantly speed up computer processes. The total time for a set of tasks can be the duration of the slowest task (plus a little overhead) rather than the sum of all the tasks combined. Some languages are built for asynchronous programming from the ground up but even though that is not the case with Python it can be surprisingly easy to run concurrent tasks.

Alternatives
------------

Different Python libraries for providing asynchronous programming often have radically different approaches. So while there may not be One Obvious Way for asynchronous programming in general there might be One Obvious Way for each approach. Each has its own strengths and weaknesses and in many cases it is a matter of personal taste[ref]People sometimes express strong preferences - in one comment, a programmer memorably described asyncio as a "complex inefficient single-core evil twin of a language" [Comment on Asyncio article](https://charlesleifer.com/blog/asyncio/#c3919)[/ref] as to which one we use. There are numerous articles on the topic but two of the best are:

* [Asyncio, twisted, tornado, gevent walk into a bar... they pay, they leave, they drink, they order](https://www.bitecode.dev/p/asyncio-twisted-tornado-gevent-walk)
* [The easy way to concurrency and parallelism with Python stdlib ... Because life doesn't have to be hard all the time](https://www.bitecode.dev/p/the-easy-way-to-concurrency-and-parallelism)

Reach for Pool Executors First
------------------------------

As recommended in "The easy way to concurrency and parallelism with Python stdlib" (above), we should reach for the pool executors first and only use more complicated approaches if we have special requirements.

"You can distribute work to a bunch of process workers or thread workers with a few lines of code:

```python
from concurrent.futures import ThreadPoolExecutor, as_completed

with ThreadPoolExecutor(max_workers=5) as executor:
    executor.submit(do_something_blockint)
```

This simple approach only covers a limited use cases, but for those, it works surprisingly well.
What's more, those use cases are the ones you are most like to have to solve by yourselves, as the other ones often have infra or libs solutions already."

Simple Pool Executor Recipes
----------------------------

The following talk was delivered several years ago but remains up-to-date - check it out - it contains multiple simple recipes using the pool executors supplied by concurrent futures.

[Practical Python Async for Dummies](https://www.youtube.com/watch?v=5_K8GwZ_268)
