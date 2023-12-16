defmodule Cliflow.MixProject do
  use Mix.Project

  if Mix.env() != :prod do
    for path <- :code.get_path(),
      Regex.match?(~r/_build/, List.to_string(path)) do
        Code.delete_path(path)
      end
  end

  @scm_url "https://github.com/cliflow/cliflow-elixir.git"

  def project do
    [
      app: :cliflow,
      name: "Cliflow",
      version: "0.1.0",
      elixir: "~> 1.15",
      deps: deps(),
      package: package(),
      xref: [
        exclude: [Cliflow.CLI]
      ],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      source_url: @scm_url,
      homepage_url: "https://cliflow.org/?lang=elixir",
      description: "Cliflow is a command line interface for your team's workflow.",
    ]
  end

  def application do
    [
      mod: {Cliflow, []},
      extra_applications: [:logger],
      env: [
        logger: true,
        stacktrace_depth: nil
      ]
    ]
  end

  defp deps do
    []
  end

  defp package do
    [
      maintainers: ["Cliflow Elixir Team"],
      licenses: ["Apache"],
      links: %{"GitHub" => @scm_url}
    ]
  end

  defp aliases do
    []
  end

end
