defmodule Inh.Repo.Migrations.AddCommentable do
  use Ecto.Migration

  def change do
    create table(:interactive_entities) do
      add :type, :string
      timestamps()
    end

    create index(:interactive_entities, [:id, :type])

    create table(:entity_comments) do
      add :content, :string
      add :entity_id, :integer

      timestamps()
    end

    create table(:entity_aknowledgements) do
      add :entity_id, references(:interactive_entities)

      timestamps()
    end

    create table(:posts, options: "INHERITS (interactive_entities)") do
      add :content, :string
    end

    create table(:attachments, options: "INHERITS (interactive_entities)") do
      add :url, :string
    end

    create table(:photos, options: "INHERITS (attachments)") do
    end

    execute """
      CREATE OR REPLACE FUNCTION internal_post_check() RETURNS TRIGGER AS $$
      BEGIN
        IF NOT EXISTS(SELECT 1 FROM posts WHERE id = new.entity_id) THEN
          RAISE EXCEPTION 'Post does not exist:  %', new.entity_id;
        END IF;
        RETURN new;
      END;
      $$ language plpgsql;
    """

    execute """
      CREATE TRIGGER CheckEntityExists BEFORE INSERT OR UPDATE ON entity_comments
      FOR EACH ROW EXECUTE PROCEDURE internal_post_check();
    """
  end
end
