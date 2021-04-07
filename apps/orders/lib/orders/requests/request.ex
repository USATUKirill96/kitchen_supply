defmodule Orders.Requests.Request do
  @moduledoc """
  Order request struct
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Orders.Requests.Request

  @timestamps_opts [type: :utc_datetime]

  schema "requests" do
    field(:point_id, :integer)
    has_many(:items, Orders.Items.Item)

    timestamps()
  end

  @spec __struct__ :: %Request{
          __meta__: Ecto.Schema.Metadata.t(),
          items: Ecto.Association.NotLoaded.t(),
          id: nil,
          point_id: nil
        }

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:point_id])
    |> validate_required([:point_id, :items])
  end
end
