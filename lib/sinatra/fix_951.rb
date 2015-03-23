require 'sinatra/show_exceptions'
Sinatra::ShowExceptions.module_eval { def pretty(*) Array super end }
