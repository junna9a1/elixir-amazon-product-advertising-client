defmodule Amad.ItemLookup do
  @moduledoc """
  The [ItemLookup](http://docs.aws.amazon.com/AWSECommerceService/latest/DG/ItemLookup.html) operation
  """

  alias __MODULE__
  alias Amad.Config

  defstruct "Condition": "New",
    "IdType": "ASIN",
    "IncludeReviewsSummary": nil,
    "ItemId": nil,
    "MerchantId": nil,
    "Operation": "ItemLookup",
    "RelatedItemPage": nil,
    "RelationshipType": nil,
    "ResponseGroup": "ItemAttributes,Images",
    "SearchIndex": nil,
    "TruncateReviewsAt": nil,
    "VariationPage": nil


  @doc """
  Execute an ItemLookup operation
  """
  def execute(search_params \\ %ItemLookup{}, config \\ %Config{}) do
    Amad.call_api search_params, config
  end
end
