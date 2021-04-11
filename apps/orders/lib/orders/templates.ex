defmodule Orders.Templates do
  @moduledoc """
  Templates API
  """

  alias Orders.Templates.Template
  alias Orders.Repo

  import Ecto.Query

  @doc """
  Returns list of templates

  TODO: Add filter by point

  ## Examples
    iex> list(point_id)
    [{template_id, template_name}, ...]

  """
  @spec list() :: [{integer(), String.t()}] | []
  def list do
    Template |> select([m], {m.id, m.name}) |> Repo.all()
  end

  @doc """
  Returns object by its id or error if object not found

  ## Examples
    iex> get(template_id)
    {:ok, %Template{}}

    iex> get(-1)
    {:error, :not_found}
  """
  @spec get(integer()) :: {:ok, %Template{}} | {:error, :not_found}
  def get(id) do
    case Repo.get(Template, id) do
      nil -> {:error, :not_found}
      template -> {:ok, Repo.preload(template, [:fields])}
    end
  end

  @doc """
  Create a template

  ## Examples
    iex> create("first template")
    {:ok, %Template{}}

    iex> create("")
    {:error, %Ecto.Changeset{}}

  """
  @spec create(%{name: String.t()}) :: %Template{}
  def create(%{name: name}) do
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
