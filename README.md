# StoicQuotes

A project to learn more about creating REST APIs with Phoenix.
 
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix

## Author Notes
The line `create unique_index(:quotes, [:quote], name: :index_for_duplicate_quotes)` in the migration ensures that the `quote` column in the `quotes` table contains unique values, meaning no two rows can have the same exact quote. This helps avoid duplicate entries in the database. Here's a breakdown:

- **`:quotes`**: Refers to the table on which the index is being created, in this case, the `quotes` table.
- **`[:quote]`**: Specifies the column or columns to include in the unique index, here it's the `quote` column.
- **`name: :index_for_duplicate_quotes`**: Specifies a custom name for the index. If you don't provide a name, Phoenix will generate one automatically.

### Other Index Implementations in Phoenix

Indexes help speed up database queries, especially on large datasets, and can enforce constraints like uniqueness.

1. **Simple Index**
   - If you want to create an index on a column to improve query performance:
   ```elixir
   create index(:quotes, [:author])
   ```
   This creates an index on the `author` column, which will make queries involving the author faster.

2. **Composite Index**
   - An index can be created on multiple columns:
   ```elixir
   create index(:quotes, [:author, :source])
   ```
   This creates an index that improves queries where both the `author` and `source` columns are used.

3. **Unique Composite Index**
   - You can enforce uniqueness across multiple columns:
   ```elixir
   create unique_index(:quotes, [:author, :source])
   ```
   This ensures that the combination of `author` and `source` is unique, meaning the same author cannot have the same source for more than one quote.

4. **Partial Index**
   - Partial indexes are used when you want to index only a subset of rows:
   ```elixir
   create index(:quotes, [:author], where: "source IS NOT NULL")
   ```
   This creates an index on the `author` column, but only for rows where the `source` is not `NULL`.
