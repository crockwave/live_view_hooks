defmodule LiveViewHooks.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :groupId, :string
      add :allDay, :boolean, default: false
      add :start, :utc_datetime, null: false
      add :end, :utc_datetime, null: false
      add :daysOfWeek, {:array, :integer}
      add :startTime, :string
      add :endTime, :string
      add :startRecur, :string
      add :endRecur, :string
      add :title, :string, null: false
      add :url, :string
      add :editable, :boolean, default: false
      add :startEditable, :boolean, default: true 
      add :durationEditable, :boolean, default: true 
      add :display, :string
      add :overlap, :boolean, default: true 
      timestamps()
    end
  end
end
