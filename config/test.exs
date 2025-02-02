import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :stoic_quotes, StoicQuotes.Repo,
  username: "postgres",
  password: "11",
  database: "stoic_quotes_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :stoic_quotes, StoicQuotesWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "YplBzt6qcCbJ+3eap4US2U53LpJvLJyuopAurZkwW4xTKbqNmXPwW4ETyFU5kjDA",
  server: false

# In test we don't send emails.
config :stoic_quotes, StoicQuotes.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
