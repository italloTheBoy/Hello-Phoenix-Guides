defmodule Hello.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :age, :integer
    field :email, :string
    field :gender, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :age, :gender])
    |> validate_required([:name, :email, :age, :gender])
    |> validate_number(:age, greater_than: 5, message: "Usuario é jovem demais")
    |> validate_format(:email, ~r/@/, message: "Email invalido")
  end
end
