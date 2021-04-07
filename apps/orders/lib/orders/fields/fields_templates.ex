defmodule Orders.Fields.FieldsTemplates do
  @moduledoc """
  Operations on M2M fields_templates connection
  """
  alias Orders.Fields.Field
  alias Orders.Templates.Template
  alias Orders.Repo

  @doc """
  Connect Field or list of Fields with Template.
  Requires Template to be saved in database before adding M2M connection to fields.
  Fields may be saved during creating connection in this function.
  """
  @spec connect_to_template(list(%Field{}) | %Field{}, %Template{}) :: %Template{}
  def connect_to_template(fields, template) when is_list(fields) do
    template = template |> preload

    fields
    |> Enum.map(&connect(template, &1))
  end

  def connect_to_template(field, template) do
    template
    |> preload
    |> connect(field)
  end

  @spec connect(%Template{}, %Field{}) :: %Template{}
  defp connect(template, field) do
    template
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.put_assoc(:fields, [field])
    |> Repo.update!()
  end

  @spec preload(%Template{}) :: %Template{}
  defp preload(template) do
    Repo.preload(template, [:fields])
  end
end
