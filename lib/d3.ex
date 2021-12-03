defmodule D3 do

  def one() do
    input = Read_File_Utils.read_file("d3.txt")
            |> Enum.map(&String.graphemes/1)
            |> IO.inspect()

    entries_count = Enum.count(input)
                    |> IO.inspect()

    parsed_gamma = input
                   |> Enum.zip()
                   |> Enum.map(&Tuple.to_list/1)
                   |> IO.inspect()
                   |> Enum.map(&find_most_common(&1, entries_count))

    parsed_epsilon = input
                     |> Enum.zip()
                     |> Enum.map(&Tuple.to_list/1)
                     |> IO.inspect()
                     |> Enum.map(&find_least_common(&1, entries_count))

    gamma = parsed_gamma
            |> Enum.join()
            |> String.to_integer(2)
            |> IO.inspect(label: "gamma")

    epsilon = parsed_epsilon
              |> Enum.join()
              |> String.to_integer(2)
              |> IO.inspect(label: "epsilon")

    epsilon * gamma
  end

  def find_most_common(list, entries_count) do
    ones_count = Enum.count(list, fn x -> x == "1" end)
    if(ones_count > entries_count / 2) do
      "1"
    else
      "0"
    end
  end

  def find_least_common(list, entries_count) do
    zeros_count = Enum.count(list, fn x -> x == "0" end)
    if(zeros_count > entries_count / 2) do
      "1"
    else
      "0"
    end
  end



  def parse_binary(binary) do
    matrix = binary
             |> String.graphemes()
             |> IO.inspect()
             |> Enum.flat_map(
                  fn binary ->
                    String.graphemes(binary)
                    |> Enum.map(&String.to_integer/1)
                    #    |> Enum.map(&map_bit/1)
                  end
                )
    #Enum.reduce(matrix, )
  end

  def map_bit(bit) do
    if bit == 0 do
      {1, 0}
    else
      {0, 1}
    end
  end

  def calc_gamma(binary_list) do



  end
end
