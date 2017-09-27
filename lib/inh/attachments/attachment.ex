defmodule Inh.Attachments.Attachment do
  use Ecto.Schema

  schema "attachments" do
    field :url, :string
    field :type, :string

    timestamps()
  end
end
