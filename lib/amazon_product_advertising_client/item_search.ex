defmodule AmazonProductAdvertisingClient.ItemSearch do
  @moduledoc false

  alias __MODULE__
  alias AmazonProductAdvertisingClient.Config

  defstruct "Availability": "Available",
    "BrowseNode": nil,
    "Condition": "New",
    "Keywords": nil,
    "Operation": "ItemSearch",
    "MaximumPrice": nil,
    "MinimumPrice": nil,
    "ResponseGroup": nil,
    "SearchIndex": nil,
    "ResponseGroup": nil,
    "Title": nil

  def execute(search_params \\ %ItemSearch{}, config \\ %Config{}) do
    AmazonProductAdvertisingClient.call_api search_params, config
  end
end
