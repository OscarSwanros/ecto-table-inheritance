defmodule Inh.EntityComments.Comment do
  use Ecto.Schema

  schema "entity_comments" do
    field :content, :string
    belongs_to :entity, Inh.InteractiveEntity

    timestamps()
  end
end
