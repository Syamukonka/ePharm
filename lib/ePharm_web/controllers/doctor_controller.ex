defmodule EPharmWeb.DoctorController do
  use EPharmWeb, :controller

  alias EPharm.Doctors
  alias EPharm.Doctors.Doctor

  def index(conn, _params) do
    doctors = Doctors.list_doctors()
    render(conn, :index, doctors: doctors)
  end

  def new(conn, _params) do
    changeset = Doctors.change_doctor(%Doctor{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"doctor" => doctor_params}) do
    case Doctors.create_doctor(doctor_params) do
      {:ok, doctor} ->
        conn
        |> put_flash(:info, "Doctor created successfully.")
        |> redirect(to: ~p"/doctors/#{doctor}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    doctor = Doctors.get_doctor!(id)
    render(conn, :show, doctor: doctor)
  end

  def edit(conn, %{"id" => id}) do
    doctor = Doctors.get_doctor!(id)
    changeset = Doctors.change_doctor(doctor)
    render(conn, :edit, doctor: doctor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "doctor" => doctor_params}) do
    doctor = Doctors.get_doctor!(id)

    case Doctors.update_doctor(doctor, doctor_params) do
      {:ok, doctor} ->
        conn
        |> put_flash(:info, "Doctor updated successfully.")
        |> redirect(to: ~p"/doctors/#{doctor}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, doctor: doctor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    doctor = Doctors.get_doctor!(id)
    {:ok, _doctor} = Doctors.delete_doctor(doctor)

    conn
    |> put_flash(:info, "Doctor deleted successfully.")
    |> redirect(to: ~p"/doctors")
  end
end
