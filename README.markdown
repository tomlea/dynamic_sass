# Dynamic SASS

Dynamic SASS is a Rails Engine (so only rails 2.3 and above) that renders your SASS templates on each request.
This is handy for platforms like heroku which have a read only file system, but run behind a caching proxy server anyway.

## Usage

1. Install the plugin, you should know how to do that by now.
2. Make sure it loads immediately after haml (it has to undo some of HAML's work).

## Enforcing the load order

Add the following line into your environment.rb near the end:

    config.plugins = [:haml, :dynamic_sass, :all]

And your done.

You should ensure that all generated css is removed when testing, and is not generated during testing.
