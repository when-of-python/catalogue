Title: The Power of Sane Defaults and Python Packaging
Date: 2024-03-07 07:00
Category: Python
Tags: python, packaging, rye, uv
Slug: the-power-of-sane-defaults-and-python-packaging
Authors: Grant Paton-Simpson
Summary: Python needs to annoint one packaging solution as the Sane Default we teach beginners and use for new projects. Rye / UV is probably the right choice, at least for now, as it covers both beginner and advanced needs.

What has your experience of Python packaging been? Do you agree with this post? Do you disagree? Please comment below.

The When of Python and Sane Defaults
====================================

Programming requires choice after choice after choice. It can be draining. Anything simplifying the choices we have to make is, all things being equal, a Good Thing. We can then focus on expressing our ideas in code and solving the problems we're there to solve.

The When of Python is about reducing the mental load of choice when it comes to Python language features. Should we use match case or if else? Should we use a for loop or a comprehension? Are there some features we can ignore or almost always ignore? What is a sane default for most cases?

Annointing a Sane Default for Python Packaging
==============================================

Which brings us to Python packaging. The community needs to get behind a single sane default that can serve beginners as well as advanced users ([Python Dependencies Are Fixable](https://matduggan.com/everyone-is-wrong-but-you/)). Perhaps Rye / UV will provide that sane default for packaging. It seems to have built successfully on the hard work and the thinking that has gone into earlier packaging solutions. Although the present state of Python packaging is a mess[ref]Obligatory XKCD reference [Python Environment](https://xkcd.com/1987/)[/ref] (try teaching Python packaging to a Python beginner if you don't believe me) it is not because people in the Python community have been making terrible decisions. It has taken a while to get to the point where better things are possible. There is good reason to think Rye / UV will be that better thing.

The time for waiting patiently for one packaging tool to gradually and definitively rise above the others is over. The community, which is expanding rapidly as new people learn Python to start using the data analytics and AI tools, needs a sane default now (see [Andrew Ng calls out Python package management as a bottleneck to AI development](https://www.deeplearning.ai/the-batch/issue-238/)). This is not to say that today's sane default will last forever, but that a tool like Rye / UV is arguably good enough right now for both beginners and those with advanced / specialist needs (see [Is UV the FUTURE of Python PACKAGING? Hynek Schlawack](https://www.youtube.com/watch?v=_FdjW47Au30&t=1s) and [Python Packaging Features Venn Diagram](https://alpopkes.com/posts/python/figures/venn_diagram.png)). We should just annoint it as the Sane Default and start focusing on it when teaching beginners or starting new projects. Even if there might be legitimate reasons to use other packaging approaches in specific cases that doesn't undermine the importance of there being a Sane Default. It would be great to make this a solved problem for what is arguably the world's most important programming language.








