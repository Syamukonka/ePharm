defmodule EPharmWeb.Dashboard.Doctors.Index do
  use EPharmWeb, :live_view

  alias EPharm.Doctors
  alias EPharm.Doctors.Doctor

  def mount(_params, _session, socket) do
    doctors = Doctors.list_doctors()
    socket = assign(socket,
      viewing_mode: 0,
      show: false,
      doctors: doctors, )

    {:ok, socket}
  end

  def handle_event("toggle_view", _, socket) do
    vm = socket.assigns.viewing_mode
    socket = assign(socket, viewing_mode: if(vm == 1, do: 0, else: 1))
    IO.puts(">>>>>>>>>>>>>>>>>>> VIEW CARD INVOKED <<<<<<<<<<<<<<<<<<<<<")
    {:noreply, socket}
  end

  def handle_event("show_form") do
    IO.puts(">>>>>>>>>>>>>>>>>>> SHOW FORM <<<<<<<<<<<<<<<<<<<<<")
    {:noreply, show: true}
  end
  def handle_event("hide_form") do
    IO.puts(">>>>>>>>>>>>>>>>>>> HIDE FORM <<<<<<<<<<<<<<<<<<<<<")
    {:noreply, show: false}
  end
end