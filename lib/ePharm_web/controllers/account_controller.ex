defmodule EPharmWeb.AccountController do
  use EPharmWeb, :controller



  def account_home(conn, _params) do
    conn
    |> put_flash(:info, "Success")
    |> render( :account)
  end
end