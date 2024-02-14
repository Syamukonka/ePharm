defmodule EPharmWeb.Layouts do
    use(EPharmWeb, :html)
    import EPharmWeb.Helpers.IconHelper

    embed_templates "layouts/*"

    attr :auth, :boolean, default: false
    attr :name, :string, default: ""
    attr :email, :string, default: ""

    def user_card(assigns) do
        ~H"""
            <div class="flex gap-2 my-2 items-center relative">
                <img src="/images/user.png" class="w-12 h-12" alt="user" />
                <div class="flex flex-col overflow-hidden">
                    <h1 class="font-bold"> <%= @name %> </h1>
                    <p class="text-xs text-gray-500 text-ellipsis"> <%= @email %></p>
                </div>
                <span :if={@auth} class="animate-pulse p-1 absolute z-10 top-2 right-0 rounded-full bg-brand-primary-600"> </span>
            </div>
        """
    end
end

