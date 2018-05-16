defmodule Amad do
  @moduledoc """
  An Amazon Product Advertising API client for Elixir
  """

  use HTTPoison.Base
  use Timex

  alias Amad.Config

  @doc """
  Make a call to the API with the specified request parameters.
  """
  def call_api(request_params, config \\ %Config{}) do
    query = [request_params, config] |> combine_params |> percent_encode_query
    get(%URI{scheme: config.scheme, host: config.host, path: config.path, query: query})
  end

  defp combine_params(params_list) do
    List.foldl(params_list, Map.new(), fn params, all_params ->
      Map.merge(Map.from_struct(params), all_params)
    end)
  end

  # `URI.encode_query/1` explicitly does not percent-encode spaces, but Amazon requires `%20`
  # instead of `+` in the query, so we essentially have to rewrite `URI.encode_query/1` and
  # `URI.pair/1`.
  defp percent_encode_query(query_map) do
    Enum.map_join(query_map, "&", &pair/1)
  end

  # See comment on `percent_encode_query/1`.
  defp pair({k, v}) do
    URI.encode(Kernel.to_string(k), &URI.char_unreserved?/1) <>
      "=" <> URI.encode(Kernel.to_string(v), &URI.char_unreserved?/1)
  end

  def process_url(url) do
    url |> URI.parse() |> timestamp_url |> sign_url() |> String.Chars.to_string()
  end

  defp timestamp_url(url_parts) do
    update_url(url_parts, "Timestamp", Timex.format!(Timex.local(), "{ISO:Extended:Z}"))
  end

  defp sign_url(url_parts) do
    hmac =
      :crypto.hmac(
        :sha256,
        Application.get_env(:amad, :secret),
        Enum.join(["GET", url_parts.host, url_parts.path, url_parts.query], "\n")
      )

    signature = Base.encode64(hmac)
    update_url(url_parts, "Signature", signature)
  end

  defp update_url(url_parts, key, value) do
    updated_query =
      url_parts.query
      |> URI.decode_query()
      |> Map.put_new(key, value)
      |> percent_encode_query

    Map.put(url_parts, :query, updated_query)
  end
end
