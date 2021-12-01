defmodule Measure do
  def ms(function) do
    function
    |> :timer.tc
    |> elem(0)
    |> Kernel./(1000)
  end
end