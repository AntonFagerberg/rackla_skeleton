defmodule RacklaSkeleton.Application do
  @moduledoc false

  use Application

  def main(_args) do
    :timer.sleep(:infinity)
  end

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    
    port = Application.get_env(:rackla_skeleton, :port, 4000)
    port = if is_binary(port), do: String.to_integer(port), else: port

    children = [
      # Define workers and child supervisors to be supervised
      Plug.Adapters.Cowboy.child_spec(:http, RacklaSkeleton.Router, [], [port: port])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RacklaSkeleton.Supervisor]
    Supervisor.start_link(children, opts)
  end
end