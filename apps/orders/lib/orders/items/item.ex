defmodule Orders.Items.Item do
  @moduledoc """
  Schema of order item
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias Orders.Items.Item

  schema "items" do
    field(:quantity, :integer)
    belongs_to(:field, Orders.Fields.Field)
    belongs_to(:request, Orders.Requests.Request)
  end

  @spec __struct__ :: %Item{
          __meta__: Ecto.Schema.Metadata.t(),
          id: nil,
          field_id: nil,
          request_id: nil
        }

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:field_id, :request_id])
    |> validate_required([:field_id, :request_id])
  end
end
