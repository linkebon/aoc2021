defmodule D1 do
  def one() do
    numbers = Read_File_Utils.read_file("d1.txt")
              |> Enum.map(&String.to_integer/1)
              |> IO.inspect()

    count_increasing(numbers)
  end

  def one_improved() do
    numbers = Read_File_Utils.read_file("d1.txt")
              |> Enum.map(&String.to_integer/1)

    (for idx <- 0..Enum.count(numbers) - 1,
         Enum.at(numbers, idx) > Enum.at(numbers, idx - 1) and idx > 0,
         do: idx)
    |> Enum.count()
  end

  def count_increasing(list) do
    [head | tail] = list
    Enum.reduce(
      tail,
      {0, head},
      fn number, {increasing_count, previous_number} ->
        if(number > previous_number) do
          {increasing_count + 1, number}
          |> IO.inspect(label: "increasing")
        else
          {increasing_count, number}
          |> IO.inspect(label: "decreasing")
        end
      end
    )
    |> elem(0)

  end

  def two() do
    Read_File_Utils.read_file("d1.txt")
    |> IO.inspect()
    |> Enum.chunk_every(3, 1, :discard)
    |> IO.inspect(label: "chunked")
    |> Enum.map(&Read_File_Utils.map_list_to_int/1)
    |> IO.inspect(label: "as ints")
    |> Enum.map(&Enum.sum/1)
    |> IO.inspect(label: "summed")
    |> count_increasing()
  end

  def two_improved() do
    Read_File_Utils.read_file("d1.txt")
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [a, b] -> b > a end)
  end
end