defmodule D6 do

  def one() do
    input = Read_File_Utils.read_file("d6.txt", ~r/,/)
    cycles = for i <- 0..8,
                 into: %{},
                 do: {to_string(i), 0}

    cycles = Enum.reduce(
      input,
      cycles,
      fn x, acc ->
        Map.update!(acc, x, &(&1 + 1))
      end
    )

    Enum.reduce(
      1..80,
      cycles,
      fn day, acc ->
        zero_count = acc
                     |> Map.get("0")

        acc = Enum.reduce(
          0..7,
          acc,
          fn i, acc ->
            acc
            |> Map.update!(
                 to_string(i),
                 fn _old ->
                   acc
                   |> Map.get(to_string(i + 1))
                 end
               )
          end
        )
        acc
        |> Map.put("8", zero_count)
        |> Map.update!("6", &(&1 + zero_count))
      end
    )
    |> Map.values()
    |> Enum.sum()
  end

  def two() do
    input = Read_File_Utils.read_file("d6.txt", ~r/,/)
    cycles = for i <- 0..8,
                 into: %{},
                 do: {to_string(i), 0}

    cycles = Enum.reduce(
      input,
      cycles,
      fn x, acc ->
        Map.update!(acc, x, &(&1 + 1))
      end
    )

    Enum.reduce(
      1..256,
      cycles,
      fn day, acc ->
        zero_count = acc
                     |> Map.get("0")

        acc = Enum.reduce(
          0..7,
          acc,
          fn i, acc ->
            acc
            |> Map.update!(
                 to_string(i),
                 fn _old ->
                   acc
                   |> Map.get(to_string(i + 1))
                 end
               )
          end
        )
        acc
        |> Map.put("8", zero_count)
        |> Map.update!("6", &(&1 + zero_count))
      end
    )
    |> Map.values()
    |> Enum.sum()
  end
end
