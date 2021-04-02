defmodule Orders.Templates.Template do
  use Ecto.Schema

  schema "templates" do
    field :name, :string
    many_to_many :fields, Orders.Fields.Field, join_through: "fields_templates"
  end
end
