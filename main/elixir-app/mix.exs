defmodule MainElixirApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :main_elixir_app,
      version: "0.1.0",
      elixir: "~> 1.14",
      deps: deps()
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.7.0"},
      {:jason, "~> 1.4"},
      {:plug_cowboy, "~> 2.5"}
    ]
  end
end
