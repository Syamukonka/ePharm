defmodule EPharmWeb.DoctorHTML do
  use EPharmWeb, :html

  embed_templates "doctor_html/*"

  @doc """
  Renders a doctor form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def doctor_form(assigns)



end
