defmodule Zones do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Zones.Zone, []),
    ]

    opts = [strategy: :simple_one_for_one, name: Zones.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Creates a zone with the given `name` and `gpio_pin`.
  """
  def create_zone(name, gpio_pin) do
    Supervisor.start_child(Zones.Supervisor, [name, gpio_pin])
  end

  @doc """
  Starts the given `zone` and ensures all other zones are stopped.
  """
  def start_zone(zone) do
    stop_all()
    Zones.Zone.turn_on(zone)
  end

  @doc """
  Stops the given `zone`.
  """
  def stop_zone(zone) do
    Zones.Zone.turn_off(zone)
  end

  @doc """
  Stops child all zones.
  """
  def stop_all() do
    Supervisor.which_children(Zones.Supervisor)
    |> Enum.each(fn {_, pid, :worker, [Zones.Zone]}->
      Zones.Zone.turn_off(pid)
    end)
  end
end
