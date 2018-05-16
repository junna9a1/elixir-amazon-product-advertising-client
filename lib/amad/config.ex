defmodule Amad.Config do
  @moduledoc """
  The configuration used for authorizing and versioning API requests.
  """
  defstruct AssociateTag:   Application.get_env(:amad, :associate_tag),
            AWSAccessKeyId: Application.get_env(:amad, :access_key),
            Service: "AWSECommerceService",
            Version: "2013-08-01",
            scheme: "http",
            host: "webservices.amazon.cn",
            path: "/onca/xml"
end
