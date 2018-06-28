defmodule Storage.MixProject do
  use Mix.Project

  def project do
    [
      app: :storage,
      version: "0.1.0",
      elixir: "~> 1.6",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Storage.Application, []}
    ]
  end

  defp rustler_crates do
    [
      math: [
        path: "native/math",
        mode: if(Mix.env() == :prod, do: :release, else: :debug),
        cargo: :system,
        default_features: false,
        features: []
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # kv store
      {:kv, in_umbrella: true},

      # Rust NIF support
      {:rustler,
       git: "https://github.com/hansihe/rustler",
       ref: "b6578ea3",
       sparse: "rustler_mix",
       override: true}
    ]
  end
end
