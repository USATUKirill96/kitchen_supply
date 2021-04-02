defmodule KitchenSupply.MixProject do
  use Mix.Project

  def project do
    [
      name: :kitchen_supply,
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [plt_add_apps: [:mix]],
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    [
      # Анализ кода
      {:dialyxir, "~> 0.4", only: :dev},
      # Рендеринг документации
      {:ex_doc, "~> 0.21", only: :dev, runtime: false}
    ]
  end
end
