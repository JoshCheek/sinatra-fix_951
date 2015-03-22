Fix for [Sinatra's issue #951](https://github.com/sinatra/sinatra/issues/951)
=============================================================================

Only checked against Sinatra version `1.4.5`

My students have been hitting this for months now.
Initially, when I figured it out, I just fixed it inline on the student's computer,
but other students hit it, too, and it's costing them time and energy.

So, figured I'll just release a gem to fix it.

Alternative
-----------

You can fix it yourself with one line, and skip this dependency:

```ruby
require 'sinatra/base'
Sinatra::ShowExceptions.module_eval { def pretty(*) Array super end }
```

LICENSE
-------

Same as Sinatra's (see [here](https://github.com/sinatra/sinatra/blob/master/LICENSE))
