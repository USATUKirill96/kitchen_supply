defmodule Orders.Templates do
  @moduledoc """
  Templates API
  """

  alias Orders.Templates.Template
  alias Orders.Repo

  @doc """
  Returns list of templates

  ## Examples
    iex> list_all()
    [%Template{}, ...]

  """
  @spec list_all :: [%Template{}] | []
  def list_all() do
    Repo.all(Template)
  end

  @doc """
  Create a template

  ## Examples
    iex> create("first template")
    {:ok, %Template{}}

    iex> create("")
    {:error, %Ecto.Changeset{}}

  """
  @spec create(atom()) :: %Template{}
  def create(name) do
    %Template{}
    |> Template.changeset(%{name: name})
    |> Repo.insert()
  end

  @doc """
  Delete a template by its id

  ## Examples

    iex> delete(template_id)
    {:ok, %Template{}}

    iex> delete(-1)
    {:error, %Ecto.Changeset{}}

  """
  @spec delete(integer()) :: %Template{}
  def delete(template_id) do
    Repo.get!(Template, template_id)
    |> Repo.delete()
  end
end
