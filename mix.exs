defmodule Amad.Mixfile do
  use Mix.Project

  def project do
    [app: :amad,
     version: "0.0.1",
     elixir: "~> 1.4",
     description: "An Amazon Product Advertising API client for Elixir",
     package: package(),
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:dogma, ">= 0.0.0", only: :dev},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:httpoison, ">= 0.0.0"},
      {:sweet_xml, ">= 0.0.0"},
      {:timex, ">= 0.0.0"},
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/junna9a1/elixir-amazon-product-advertising-client"},
      maintainers: ["Jun Nagai <junna9a1@gmail.com>"]
    ]
  end
end
