defmodule PhoenixTrello.Mixfile do
  use Mix.Project

  def project() do
    [app: :phoenix_trello,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application() do
    [mod: {PhoenixTrello, []},
     applications: [
      :phoenix,
      :phoenix_pubsub,
      :phoenix_html,
      :cowboy,
      :logger,
      :phoenix_ecto,
      :postgrex,
      :comeonin,
      :ex_machina
    ]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps() do
    [
      {:phoenix, "~> 1.5.7"},
      {:ecto_sql, "~> 3.0"},
      {:phoenix_ecto, "~> 4.0"},
      {:postgrex, ">= 0.0.0", override: true},
      {:phoenix_html, "~> 2.9"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:phoenix_pubsub, "~> 2.0"},
      {:plug_cowboy, "~> 2.1"},
      {:plug, "~> 1.7"},
      {:comeonin, "~> 5.3.2"},
      {:guardian, "~> 2.0"},
      {:guardian_phoenix, "~> 2.0"},
      {:argon2_elixir, "~> 2.0"},
      {:bcrypt_elixir, "~> 2.0"},
      {:pbkdf2_elixir, "~> 1.0"},
      {:credo, "~> 1.5.5", only: [:dev, :test]},
      {:ex_machina, "~> 2.7.0"},
      {:exactor, "~> 2.2.0"},
      {:hound, "~> 1.1.1"},
      {:jason, "~> 1.0"},
      {:mix_test_watch, "~> 0.2", only: :dev}
     ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases() do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"],
      ":test": ["ecto.create --quiet", "ecto.migrate", "test"]]
  end
end
