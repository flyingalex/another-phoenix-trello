use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_trello, PhoenixTrello.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_trello, PhoenixTrello.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "another_phoenix_trello_dev",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Guardian configuration
config :phoenix_trello, PhoenixTrello.GuardianSerializer,
  secret_key: "EWy7SIHoUrhvo+j/2+GQD+66DQkILEySAKdaTL6uSSguUWYFNXD1Bvnm1HDRDjqV"
