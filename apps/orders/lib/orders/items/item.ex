defmodule Orders.Items.Item do
  use Ecto.Schema

  schema "items" do
    field :quantity, :integer
    belongs_to :field, Orders.Fields.Field
    belongs_to :request, Orders.Requests.Request
  end
end
