defmodule StoicQuotesWeb.QuotesController do
  use Phoenix.Controller, formats: [:json]
  alias StoicQuotesWeb.QuotesJson
  alias StoicQuotes.Quotes

  def index(conn, _params) do
    quotes =  Quotes.list_quotes()
    # render(conn, :index, quotes)
    json(conn, QuotesJson.index(%{quotes: quotes}))
  end

  @spec show(any(), any()) :: %{quotes: any()}
  def show(conn, _params) do
    quote = Quotes.get_random_quote()
    # render(conn, :show, quote)
    json(conn, QuotesJson.show(%{quote: quote}))
  end
end
