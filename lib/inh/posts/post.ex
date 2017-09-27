defmodule Inh.Posts.Post do
  use Ecto.Schema

  schema "posts" do
    field :content, :string
    field :type, :string

    timestamps()
  end
end

