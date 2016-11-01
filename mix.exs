defmodule Xmlixer.Mixfile do
  use Mix.Project

  def project do
    [app: :xmlixer,
     version: "0.1.1",
     elixir: "~> 1.3",
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    []
  end

  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    """
    A simple wrapper around erlang's xmerl to generate XML in elixir.
    """
  end

  defp package do
    [
     name: :xmlixer,
     files: ["lib", "mix.exs", "README.md"],
     maintainers: ["Chintan Thakkar"],
     licenses: ["Apache 2.0"],
     links: %{"GitHub" => "https://github.com/lemnisk8/xmlixer"}]
  end
end
