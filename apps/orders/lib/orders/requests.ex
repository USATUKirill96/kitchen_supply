defmodule Orders.Requests do
  @moduledoc """
  Requests API
  """

  alias Orders.Requests.Request
  alias Orders.Repo

  @doc """
  Returns list of requests

  ## Examples
    iex> list_all()
    [%Request{}, ...]

  """
  @spec list_all :: [%Request{}] | []
  def list_all() do
    Repo.all(Request)
  end

  @doc """
  Create a request

  ## Examples
    iex> create(point_id))
    {:ok, %Request{}}

    iex> create("")
    {:error, %Ecto.Changeset{}}

  """
  @spec create(integer()) :: %Request{}
  def create(point_id) do
    %Request{}
    |> Request.changeset(%{point_id: point_id})
    |> Repo.insert()
  end

  @doc """
  Delete a request by its id

  ## Examples

    iex> delete(request_id)
    {:ok, %Request{}}

    iex> delete(-1)
    {:error, %Ecto.Changeset{}}

  """
  @spec delete(integer()) :: %Request{}
  def delete(request_id) do
    Repo.get!(Request, request_id)
    |> Repo.delete()
  end
end
