[![Build Status](https://secure.travis-ci.org/JoshCheek/sinatra-fix_951.png?branch=master)](https://travis-ci.org/JoshCheek/sinatra-fix_951)

Fix for Sinatra 1.4.5's [issue #951](https://github.com/sinatra/sinatra/issues/951)
===================================================================================

**NOTE THAT THIS IS UNNECESSARY FOR 1.4.6+, BECAUSE THE BUG IS FIXED IN THOSE RELEASES!!**

How to know if you hit this
---------------------------

You will know if you hit this, because you'll get an error message like

```
NoMethodError: undefined method `join' for #<String:0x007f62c3e6fb90>
```

Or maybe one like this:

```
Unexpected error while processing request: undefined method `join' for #<String:0x007fa3d244d1f8>
```

If you want to understand it better, the issue is [here](https://github.com/sinatra/sinatra/issues/951),
and I traced its history and explained what happened and why [here](https://github.com/sinatra/sinatra/issues/951#issuecomment-73140540).

If you want to understand why this fixes the issue,
then you'll need to learn the Ruby Object Model.
This is a class that [I teach](http://today.turing.io/outlines/2015-03-11#object-model-2httpsgithubcomjoshcheekruby-object-model),
come and learn with us at the [Turing School of Software and Design](http://turing.io/)!

Installing
----------

If you're using Bundler, then add this to your Gemfile:

```ruby
gem 'sinatra-fix_951', require: 'sinatra/fix_951'
```

If you aren't using Bundler, then install it from the command-line:

```sh
$ gem install sinatra-fix_951
```

And then require it wherever you're currently requiring Sinatra:

```ruby
require 'sinatra/fix_951'
```

LICENSE
-------

MIT, to mirror [Sinatra's license](https://github.com/sinatra/sinatra/blob/master/LICENSE).
