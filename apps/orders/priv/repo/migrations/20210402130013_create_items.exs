defmodule Orders.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :quantity, :integer
      add :field_id, references(:fields)
      add :request_id, references(:requests)
    end

    create unique_index(:items, [:field_id, :request_id])
  end
end
