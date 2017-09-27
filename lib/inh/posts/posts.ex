defmodule Inh.Posts do
  import Ecto.Changeset
  alias Inh.{Repo, Posts.Post}

  def all(), do: Repo.all(Post)

  def create_post(params) do
    %Post{type: "post"}
    |> post_changeset(params)
    |> Repo.insert()
  end

  # Changesets
  defp post_changeset(model, params) do
    model
    |> cast(params, ~w(content type))
  end
end
