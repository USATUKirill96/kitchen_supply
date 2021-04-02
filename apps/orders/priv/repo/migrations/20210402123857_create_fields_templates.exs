defmodule Orders.Repo.Migrations.CreateFieldsTemplates do
  use Ecto.Migration

  def change do
    create table(:fields_templates) do
      add :field_id, references(:fields)
      add :template_id, references(:templates)
    end

    create unique_index(:fields_templates, [:field_id, :template_id])
  end
end
