defmodule Orders.Repo.Migrations.CreateRequests do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :point_id, :integer
    end
  end
end
