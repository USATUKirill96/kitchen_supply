defmodule Orders.Fields do
  @moduledoc """
  Fields API
  """

  alias Orders.Fields.{Field, FieldsTemplates}
  alias Orders.Templates.Template
  alias Orders.Repo

  @spec list_all :: [%Field{}] | []
  def list_all() do
    Repo.all(Field)
  end

  @spec new(atom()) :: Ecto.Changeset.t()
  def new(name) do
    %Field{}
    |> Field.changeset(%{name: name})
  end

  @spec create(atom()) :: %Field{}
  def create(name) do
    new(name)
    |> Repo.insert()
  end

  @spec delete(integer()) :: %Field{}
  def delete(field_id) do
    Repo.get!(Field, field_id)
    |> Repo.delete()
  end

  @spec connect_to_template(list(%Field{}) | %Field{}, %Template{}) :: %Template{}
  defdelegate connect_to_template(fields, templates), to: FieldsTemplates
end
