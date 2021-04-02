defmodule Orders.Requests.Request do
  use Ecto.Schema

  schema "requests" do
    field(:point_id, :integer)
    has_many(:items, Orders.Items.Item)
  end
end
