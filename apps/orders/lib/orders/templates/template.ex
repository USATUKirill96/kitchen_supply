defmodule Orders.Templates.Template do
  @moduledoc """
    Структура шаблона заявкий

  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Orders.Templates.Template

  schema "templates" do
    field(:name, :string)
    many_to_many(:fields, Orders.Fields.Field, join_through: "fields_templates")
  end

  @spec __struct__ :: %Template{
          __meta__: Ecto.Schema.Metadata.t(),
          fields: Ecto.Association.NotLoaded.t(),
          id: nil,
          name: nil
        }

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end

end
