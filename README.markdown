About
=====

Jeff Verkoeyen has alluded to the creation of a Three20'esque URL<->View Controller router for Nimbus as part of his SOCKit project...but I had a very real need for such a thing earlier today. So, I made one. A rather braindead URL->View Controller mapper, but it serves my purposes well enough.

There is a very simple example project included. The intention of this router is that it will be extremely easy to plug into a subclass of AFNetworking's AFRestClient. And, assuming that your REST API subscribes to some notions of HATEOAS, it should be *incredibly* easy to connect to your backend.

Why
=====

I don't know about you, but I'm really tired of explicitly importing and pushing view controllers. It feels incredibly brittle. So, why not outsource the responsibility? Tell one object about all of your view controllers and make it figure things out.

Some Specifics
====

Every view controller that wants to participate in the routing system must implement the `Routable` protocol. And they should be initializable solely through their `-init` method. That's it. You can't route the root yet. 

MIT License
=====

    Copyright (c) 2011 Aaron Brethorst

    Permission is hereby granted, free of charge, to any person obtaining a
    copy of this software and associated documentation files (the "Software"),
    to deal in the Software without restriction, including without limitation
    the rights to use, copy, modify, merge, publish, distribute, sublicense,
    and/or sell copies of the Software, and to permit persons to whom the
    Software is furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
    DEALINGS IN THE SOFTWARE.