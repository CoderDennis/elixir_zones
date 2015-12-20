# Zones

Elixir library to wrap [Elixir/ALE](https://github.com/fhunleth/elixir_ale) GPIO code and control sprinkler zones on a Raspberry Pi.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add zones to your list of dependencies in `mix.exs`:

        def deps do
          [{:zones, "~> 0.0.1"}]
        end

  2. Ensure zones is started before your application:

        def application do
          [applications: [:zones]]
        end
