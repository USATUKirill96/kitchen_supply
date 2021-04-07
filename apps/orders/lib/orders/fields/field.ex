defmodule Orders.Fields.Field do
  @moduledoc """
  Schema of a template field
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Orders.Fields.Field

  schema "fields" do
    field(:name, :string)
    many_to_many(:templates, Orders.Templates.Template, join_through: "fields_templates")
  end

  @spec __struct__ :: %Field{
          __meta__: Ecto.Schema.Metadata.t(),
          templates: Ecto.Association.NotLoaded.t(),
          id: nil,
          name: nil
        }

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
