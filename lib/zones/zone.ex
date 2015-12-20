defmodule Zones.Zone do
  @doc """
  Starts a zone with the given `name` and `gpio_pin`.
  """
  def start_link(name, gpio_pin) do
    {:ok, pid} = Gpio.start_link(gpio_pin, :output, name: name)
    Gpio.write(pid, 1)
    {:ok, pid}
  end

  @doc """
  Turns on the zone with the given `name`.
  """
  def turn_on(name) do
    Gpio.write(name, 0)
  end

  @doc """
  Turns off the zone with the given `name`.
  """
  def turn_off(name) do
    Gpio.write(name, 1)
  end
end
