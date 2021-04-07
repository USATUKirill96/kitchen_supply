defmodule Orders.Items do
  @moduledoc """
  Items API
  """

  alias Orders.Items.Item
  alias Orders.Repo

  @doc """
  Returns a list of items

  ## Examples
    iex> list_all()
    [%Item{}, ...]

  """
  @spec list_all :: [%Item{}] | []
  def list_all() do
    Repo.all(Item)
  end

  @doc """
  Create an item struct

  Input: map containing item info.
  The map must contain these key-value pairs:
    - quantity: integer()
    - field_id: integer()
    - request_id: integer()

  ## Examples
    iex> create("first item")
    {:ok, %Item{}}

    iex> create("")
    {:error, %Ecto.Changeset{}}

  """
  @spec create(%{atom() => integer()}) :: %Item{}
  def create(item_data) do
    %Item{}
    |> Item.changeset(item_data)
    |> Repo.insert()
  end

  @doc """
  Delete an item by its id

  ## Examples

    iex> delete(item_id)
    {:ok, %Item{}}

    iex> delete(-1)
    {:error, %Ecto.Changeset{}}

  """
  @spec delete(integer()) :: %Item{}
  def delete(item_id) do
    Repo.get!(Item, item_id)
    |> Repo.delete()
  end
end
