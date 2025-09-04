defmodule LegacyElixirApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :legacy_elixir_app,
      version: "0.9.0",
      elixir: "~> 1.13",
      deps: deps()
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.6.0"},
      {:jason, "~> 1.3"},
      {:plug_cowboy, "~> 2.4"}
    ]
  end
end
