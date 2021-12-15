defmodule Hydra.Stores.Store do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "stores" do
    field :description, :string
    field :email, :string
    field :lat, :float
    field :lng, :float
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(store, attrs) do
    store
    |> cast(attrs, [:name, :lat, :lng, :description, :email])
    |> validate_required([:name, :lat, :lng, :description, :email])
  end
end
