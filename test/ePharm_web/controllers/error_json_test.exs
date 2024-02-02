defmodule EPharmWeb.ErrorJSONTest do
  use EPharmWeb.ConnCase, async: true

  test "renders 404" do
    assert EPharmWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert EPharmWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
