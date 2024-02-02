defmodule EPharmWeb.AccountController do
  use EPharmWeb, :controller

  plug :put_layout, html: {EPharmWeb.Layouts, :dashboard_layout}

  def account_home(conn, _params) do
    conn
    |> put_flash(:info, "Success")
    |> render( :account)
  end
end