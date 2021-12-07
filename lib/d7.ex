defmodule D7 do

  def one() do
    input = Read_File_Utils.read_file("d7.txt", ~r/,/)
            |> Enum.map(&String.to_integer/1)

    Enum.reduce(
      # the points to calculate fuel for
      Enum.min(input) + 1..Enum.max(input) - 1,
      %{},
      fn i, acc ->
        # add to map in format %{point: [fuel_cost_for_crab_position]}
        acc
        |> Map.put(
             i,
             Enum.reduce(
               input,
               [],
               fn crab_pos, fuel_cost_list ->
                 [calc_distance_to_position(crab_pos, i) | fuel_cost_list]
               end
             )
           )
      end
    )
    |> calc_least_fuel_cost
  end

  def calc_least_fuel_cost(fuel_cost_map) do
    fuel_cost_map
    |> Enum.(
         fn {_point, fuel_cost_list} ->
           Enum.sum(fuel_cost_list)
         end
       )
    |> Enum.min()
  end

  def calc_distance_to_position(crab_pos, to_position) do
    abs(crab_pos - to_position)
  end

end
