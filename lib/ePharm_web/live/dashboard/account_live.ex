defmodule EPharmWeb.Dashboard.AccountLive do
  use EPharmWeb, :live_view

  embed_templates("account_html/*")

  #mount (params, session, socket)
  def mount(_params, _session, socket) do
    socket = assign(socket,
      viewing_mode: 2)
    {:ok, socket}
  end

  #handle event
  def handle_event("left", _, socket) do
    socket = assign(socket, viewing_mode: 0)
    {:noreply, socket}
  end

  #handle event
  def handle_event("right", _, socket) do
    socket = assign(socket, viewing_mode: 1)
    {:noreply, socket}
  end

  #Render
end