defmodule StoicQuotesWeb.QuotesJson do
  alias StoicQuotes.Quotes.Quote

  def index(%{quotes: quotes}) do
    %{data: for(quote <- quotes, do: data(quote))}
  end

  def show(%{quote: quote}) do
    %{data: data(quote)}
  end

  def data(%Quote{} = datum) do
    %{
      quote: datum.quote,
      author: datum.author,
      source: datum.source
    }
  end

  def data(invalid_data) do
    # Log or handle invalid data, but don't crash
    IO.inspect(invalid_data, label: "Invalid data structure")
    %{error: "Invalid data structure"}
  end
end
