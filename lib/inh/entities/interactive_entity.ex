defmodule Inh.InteractiveEntity do
  use Ecto.Schema

  schema "interactive_entities" do
    has_many :comments, Inh.EntityComments.Comment, foreign_key: :entity_id
    field :type, :string

    timestamps()
  end
end
