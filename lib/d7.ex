defmodule D7 do

  def one() do
    input = Read_File_Utils.read_file("d7.txt", ~r/,/)
            |> Enum.map(&String.to_integer/1)
            |> IO.inspect(label: "input")

    min = Enum.min(input)
          |> IO.inspect(label: "min")
    max = Enum.max(input)
          |> IO.inspect(label: "max")

    fuel_cost_map = Enum.reduce(
      min + 1..max - 1,
      %{},
      fn i, acc ->
        acc
        |> Map.put(
             i,
             Enum.reduce(
               input,
               [],
               fn crab_pos, distance_list ->
                 # calc crab pos distance to if d
                 v = abs(crab_pos - i)
                 #|> IO.inspect(label: "cp: #{crab_pos} i:#{i} distance")
                 [v | distance_list]

               end
             )
           )
      end
    )
    #|> IO.inspect(label: "fuel cost for distance point:{distance:[fuel for each point]}")

    fuel_cost_map
    |> Enum.map(
         fn {point, fuel_cost_list} ->
           Enum.sum(fuel_cost_list)
         end
       )
    |> Enum.min()


  end

  def calc_distance_to_position(crab_pos, to_position) do
    abs(crab_pos - to_position)
  end

end
