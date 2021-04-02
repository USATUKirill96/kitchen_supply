defmodule Orders.Fields.Field do
  use Ecto.Schema

  schema "fields" do
    field :name, :string
    many_to_many :templates, Orders.Templates.Template, join_through: "fields_templates"
  end
end
