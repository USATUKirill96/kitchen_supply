defmodule Orders.Templates do
  @moduledoc """
  Логика работы с шаблонами заявок
  """
  alias Orders.Templates.Template
  alias Orders.Repo

  @spec create(String.t()) :: %Template{}
  def create(name) do
    %Template{}
    |> Template.changeset(%{"name" => name})
    |> Repo.insert()
  end

  @spec delete(integer()) :: %Template{}
  def delete(template_id) do
    Repo.get!(Template, template_id)
    |> Repo.delete()
  end

  @spec list_all :: [%Template{}] | []
  def list_all() do
    Repo.all(Template)
  end
end
