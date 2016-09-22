defmodule RacklaSkeleton.Mixfile do
  use Mix.Project

  def project do
    [
      app: :rackla_skeleton,
      version: "1.0.0",
      elixir: "~> 1.0",
      deps: deps,
      escript: escript,
      description: "Rackla skeleton - example implementation."
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      applications: applications(Mix.env),
      mod: {RacklaSkeleton.Application, []}
    ]
  end

  defp applications(:dev), do: applications(:all) ++ [:remix]
  defp applications(_all), do: [:logger, :rackla, :cowboy]

  defp deps do
    [
      {:rackla, "~> 1.2"},
      {:cowboy, "~> 1.0"},
      {:remix, "~> 0.0", only: :dev}
    ]
  end

  def escript do
    [main_module: RacklaSkeleton.Application]
  end
end
