defmodule Orders.Fields do
  @moduledoc """
  Fields API

  TODO:
    1. Optimise database queries for bulk creation;
    2. Store fields info in memory.
  """

  import Ecto.Query

  alias Orders.Fields.{Field, FieldsTemplates}
  alias Orders.Templates.Template
  alias Orders.Repo

  @doc """
  Returns list of fields, filtred by name prefix. Case insensitive

  ## Examples
    iex> search(name)
    [%{name: String.t(), id: integer()}, ...]

  """
  @spec search(String.t()) :: [%{name: String.t(), id: integer()}]
  def search(prefix) do
    Field
    |> select([m], %{name: m.name, id: m.id})
    |> Repo.all()
    |> IO.inspect()
    |> Enum.filter(&String.starts_with?(String.downcase(&1.name), String.downcase(prefix)))
  end

  @doc """
  Create a field

  ## Examples
    iex> create("second field")
    {:ok, %Field{}}

    iex> create("")
    {:error, %Ecto.Changeset{}}

  """
  @spec create(String.t()) :: %Field{}
  def create(name) do
    %Field{}
    |> Field.changeset(%{name: name})
    |> Repo.insert()
  end

  @doc """
  Delete a field by its id

  ## Examples

    iex> delete(field_id)
    {:ok, %Field{}}

    iex> delete(-1)
    {:error, %Ecto.Changeset{}}

  """
  @spec delete(integer()) :: %Field{}
  def delete(field_id) do
    Repo.get!(Field, field_id)
    |> Repo.delete()
  end

  @doc """
  Create many-to-many connection between fields and template
  """
  @spec connect_to_template(list(%Field{}) | %Field{}, %Template{}) :: %Template{}
  defdelegate connect_to_template(fields, template), to: FieldsTemplates
end
