defmodule StoicQuotes.Repo.Migrations.CreateQuotes do
  use Ecto.Migration

  def change do
    create table(:quotes) do
      add :quote, :text
      add :author, :string
      add :source, :string

      timestamps()
    end

    create unique_index(:quotes, [:quote], name: :index_for_duplicate_quote)
  end
end
