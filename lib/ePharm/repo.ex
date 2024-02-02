defmodule EPharm.Repo do
  use Ecto.Repo,
    otp_app: :ePharm,
    adapter: Ecto.Adapters.Postgres
end
