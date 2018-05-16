defmodule Amad.ItemSearch do
  @moduledoc """
  The [ItemSearch](http://docs.aws.amazon.com/AWSECommerceService/latest/DG/ItemSearch.html) operation

  """

  alias __MODULE__
  alias Amad.Config

  defstruct "Availability": nil,
      "BrowseNode": nil,
      "BrowseNodeId": nil,
      "Condition": "New",
      "ItemPage": nil,
      "Keywords": nil,
      "MaximumPrice": nil,
      "MinimumPrice": nil,
      "Operation": "ItemSearch",
      "ResponseGroup": nil,
      "SearchIndex": "All",
      "Sort": nil,
      "Title": nil,
      "MerchantId": "Amazon"


  @doc """
  Execute an ItemSearch operation
  """
  def execute(search_params \\ %ItemSearch{}, config \\ %Config{}) do
    Amad.call_api search_params, config
  end
end
