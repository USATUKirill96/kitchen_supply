defmodule Orders.Repo.Migrations.CreateFields do
  use Ecto.Migration

  def change do
    create table(:fields) do
      add :name, :string
    end

    create unique_index(:fields, [:name])
  end
end
