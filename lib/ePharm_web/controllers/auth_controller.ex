defmodule EPharmWeb.AuthController do
  use EPharmWeb, :controller

  def auth(conn, %{"mode" => mode}) do
    mMode = if String.downcase(mode) === "sign-up" or String.downcase(mode) === "signup" or String.downcase(mode) === "sign up" do
      "Sign up"
    else
      "Login in"
    end
    render(conn, :auth, mode: mMode)
  end

  def login(conn, %{:email => email, :password => password}) do
    if(byte_size(email) > 0 and byte_size(password) > 0) do
        render(conn, :welcome, email: email)
      else
        render(conn, :auth)
      end
  end

  def signup(conn, params) do
    creds = %{:email => email, :password => password, :firstName => f_name, :lastName => l_name} = params
    if(byte_size(email) > 0 and byte_size(password) > 0) do
      render(conn, :welcome, creds)
    else
      render(conn, :auth)
    end
  end
end