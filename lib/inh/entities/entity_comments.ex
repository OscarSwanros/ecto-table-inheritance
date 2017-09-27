defmodule Inh.EntityComments do
  import Ecto.{Changeset, Query}

  alias Inh.{Repo, EntityComments.Comment, InteractiveEntity}

  def all_for_entity_type(id, type) when is_binary(id), do: String.to_integer(id) |> all_for_entity_type(type)
  def all_for_entity_type(id, type) when is_integer(id) do
    entity = get_entity(id, type)

    entity.comments
  end

  def create_for_entity(id, type, params) when is_binary(id), do: String.to_integer(id) |> create_for_entity(type, params)
  def create_for_entity(id, type, params) when is_integer(id) do
    params =
      params
      |> Enum.map(fn({key, value}) -> {String.to_atom(key), value} end)

    get_entity(id, type)
    |> Ecto.build_assoc(:comments, params)
    |> Repo.insert()
  end

  # Private
  defp get_entity(id, type) do
    q =
      from entity in InteractiveEntity,
      where: entity.id == ^id and entity.type == ^type,
      left_join: comments in assoc(entity, :comments),
      preload: [comments: comments]

    Repo.one(q)
  end

  defp comment_changeset(model, params) do
    model
    |> cast(params, ~w(content entity_id))
  end
end
