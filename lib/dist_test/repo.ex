defmodule DistTest.Repo do
  use Ecto.Repo,
    otp_app: :dist_test,
    adapter: Ecto.Adapters.Postgres
end
