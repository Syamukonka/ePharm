defmodule EPharmWeb.Plugs.LogUserSystem do
  import Plug.Conn

  @locales ["en", "fr", "sp"]
  @locale_map %{"en" => "English", "fr" => "French", "sp" => "Spanish"}

  def init(default), do: default

  def call(%Plug.Conn{params: %{"locale" => loc}} = conn, _default) when loc in @locales do

    #plat = for {key, val} <- conn.req_headers, into: %{}, do: {key => val}
    assign(conn, :locale, @locale_map[loc])
  end

  def call(conn, default) do
    assign(conn, :locale, @locale_map[default])
  end
end

defmodule EPharmWeb.Plugs.FakeAuthentication do
  import Plug.Conn

  def init(default), do: default

  def call(conn, _params) do
    IO.puts(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    IO.puts("User Authenticated")
    IO.puts(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
    assign(conn, :authenticated, true)
  end
end