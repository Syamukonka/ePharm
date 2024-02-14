defmodule EPharm.Doctors.Doctor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "doctors" do
    field :bio, :string
    field :deptartment, :string
    field :first_name, :string
    field :last_name, :string
    field :rating, :integer
    field :specialization, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(doctor, attrs) do
    doctor
    |> cast(attrs, [:first_name, :last_name, :specialization, :deptartment, :rating, :bio])
    |> validate_required([:first_name, :last_name, :specialization, :deptartment, :rating, :bio])
  end
end
