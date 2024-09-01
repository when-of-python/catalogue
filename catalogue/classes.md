Classes <a class="status common">Common Python</a>
=======

TL;DR
-----

Classes are essential for Object-Oriented Programming (OOP) but sometimes functions are better when the focus is on actions rather than state.

Description
-----------

Classes enable us to define and make objects.

Example
-------

```python
class Person:

    def __init__(self, name: str, age: int):
        self.name = name
        self.age = age

    def text(self, msg: str):
        send_text(f"Hi {self.name}\n{msg}")

grace = Person('Grace', 32)
grace.text("Let's meet for lunch tomorrow")
```

When not to use
---------------

If our code is action-oriented rather than about state.

For example, instead of:

```python
class SendEmail:

    def send(self, address: str, msg: str):
        email_lib(address, msg)
```

we could write:

```python
def send_email(address: str, msg: str):
    email_lib(address, msg)
```

It is often a bad sign if a class only has one method (ignoring `__init__`).

Sometimes classes are used instead of functions even when action-oriented because there is a desire to avoid repeating some settings. For example, maybe we have an html setting we want set to True for multiple operations:

```python
class SendEmail:

    def __init__(self, *, html=False):
        self.html = html

    def send(self, address: str, msg: str):
        email_lib(address, msg, html=self.html)
```

In this case we make our html setting once when instantiating the object and use that object to send lots of html emails without having to specify the html setting each time. For example:

```python
emailer = SendEmail(html=True)
emailer.send('leanpython@example.com', '<p>Keep up the good work!</p>')
emailer.send('psf@example.com', '<p>Thanks for supporting Python!</p>')
```

There is a better alternative though that avoids any OOP overhead:

```python
from functools import partial

def send_email(address: str, msg: str, *, html=False):
    email_lib(address, msg, html=html)

send_html_email = partial(send_email, html=True)
send_html_email('leanpython@example.com', '<p>Keep up the good work!</p>')
send_html_email('psf@example.com', '<p>Thanks for supporting Python!</p>')
```

Links
-----

[Functions vs Classes: When to Use Which and Why?](https://www.youtube.com/watch?v=txRTzljmV0Q)
