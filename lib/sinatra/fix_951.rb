# fix the Sinatra 1.4.5 bug
require 'sinatra/show_exceptions'
Sinatra::ShowExceptions.module_eval { def pretty(*) Array super end }
