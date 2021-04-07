defmodule Orders.Repo.Migrations.CreateRequests do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :point_id, :integer

      timestamps([type: :utc_datetime])
    end
  end
end
