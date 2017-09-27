defmodule Inh.Attachments do
  import Ecto.Changeset
  alias Inh.{Repo, Attachments.Attachment}

  def all(), do: Repo.all(Attachment)

  def create_attachment(params) do
    %Attachment{type: "attachment"}
    |> attachment_changeset(params)
    |> Repo.insert()
  end

  # Changesets
  defp attachment_changeset(model, params) do
    model
    |> cast(params, ~w(url type))
  end
end
