defmodule EPharmWeb.AuthController do
  use EPharmWeb, :controller
  alias EPharm.Accounts
  alias EPharm.Accounts.User

  def auth(conn, %{"mode" => mode}) do
    mMode = if String.downcase(mode) === "sign-up" or String.downcase(mode) === "signup" or String.downcase(mode) === "sign up" do
      "Sign up"
    else
      "Login in"
    end
    changeset = Accounts.change_user(%User{})
    render(conn, :auth, mode: mMode, changeset: changeset)
  end

  def login(conn, %{:email => email, :password => password}) do
    if(byte_size(email) > 0 and byte_size(password) > 0) do
        render(conn, :welcome, email: email)
      else
        render(conn, :auth)
      end
  end

  def signup(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Success!!")
        |> redirect(to: "/account")

     {:error, %Ecto.Changeset{} = changeset} ->
       conn
       |> put_flash(:error, "Failed: Invalid credentials")
       |> redirect(to: "/auth/signup", changeset: changeset)
    end
  end
end
