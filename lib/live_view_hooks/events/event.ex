defmodule LiveViewHooks.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :groupId, :string  # if not null, all events associated with groupid drag together
    field :allDay, :boolean, default: false  # if true, ignore start and end values
    field :start, :utc_datetime  # event start time, in Zulu
    field :end, :utc_datetime  # event end time
    field :daysOfWeek, {:array, :integer}  # list [1, 2, 5] of days of week for recurring events
    field :startTime, :string  # starttime of recurring event
    field :endTime, :string  # endtime of recurring event
    field :startRecur, :string # start date/time of recurring event cycle
    field :endRecur, :string # end date/time of recurring event cycle
    field :title, :string  # event title
    field :url, :string  # url to event
    field :editable, :boolean, default: false  # toggle event start/end editability
    field :startEditable, :boolean, default: true  # toggle editability of event start
    field :durationEditable, :boolean, default: true  # toggle editability of event duration
    field :display, :string  # 'auto' (default), 'block', 'list-item', 'background', inverse-background', 'none'
    field :overlap, :boolean, default: true  # toggle allowing events to be overlapped
    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :start, :end, :allDay])
    |> validate_required([:title, :start, :end, :allDay])
  end
end
