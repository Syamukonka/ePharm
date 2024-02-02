defmodule EPharmWeb.HomeController do
  use EPharmWeb, :controller

  def home(conn, _params) do
    render(conn, :home, layout: false)
  end
end
