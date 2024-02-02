defmodule EPharmWeb.Layouts do
  use(EPharmWeb, :html)
  import EPharmWeb.Helpers.IconHelper

  embed_templates "layouts/*"

  attr :auth, :boolean, default: false

  def user_card(assigns) do
      ~H"""
          <div class="flex gap-2 my-2 items-center relative">
              <%= icon("user-circle", class: "w-12 h-12") %>
              <div class="flex flex-col overflow-hidden">
                  <h1 class="font-bold"> Gregory Jaldi </h1>
                  <p class="text-xs text-gray-500 text-ellipsis">greg-jaldi@epharm.com</p>
              </div>
              <%= if(@auth) do %>
                  <span class="p-1 absolute z-10 top-2 right-0 rounded-full bg-green-500"> </span>
              <% end %>
          </div>
      """
  end
end

