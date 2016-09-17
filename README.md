# Rackla Skeleton

This is a skeleton project which implements [Rackla](https://github.com/AntonFagerberg/rackla) as a library. For more information and documentation, please see the [Rackla's GitHub page](https://github.com/AntonFagerberg/rackla) or the [Rackla documentation on HexDocs](http://hexdocs.pm/rackla/)!

## This project provides
 * Default project structure
 * [Predefined Plug router using Rackla](https://github.com/elixir-lang/plug#the-plug-router)
 * [Supervised handler for Plug](https://github.com/elixir-lang/plug#supervised-handlers)
 * Example tests
 * `mix.server` task for starting the server
 * [Remix](https://github.com/AgilionApps/remix) for hot reloading during development 

### Starting the application
The application will be started automatically when running `iex -S mix` from the project root. You can also start it by running `mix server`. By default, it will start on port 4000, but you can change the port either from the file `config/config.exs` or by setting the environment variable `PORT`.

### Deploy to Heroku
The [Heroku Buildpack for Elixir](https://github.com/HashNuke/heroku-buildpack-elixir) works out of the box for Rackla when doing a full installation.

### Docker
A [Dockerfile](https://github.com/AntonFagerberg/rackla/Docker) is included, thanks [Jan Kronquist](https://github.com/jankronquist)!