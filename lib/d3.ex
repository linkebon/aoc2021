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
                   |> Enum.map(&convert_bit_to_gamma_bit(&1, entries_count))

    parsed_epsilon = input
                     |> Enum.zip()
                     |> Enum.map(&Tuple.to_list/1)
                     |> IO.inspect()
                     |> Enum.map(&convert_bit_to_epsilon_bit(&1, entries_count))

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

  def convert_bit_to_gamma_bit(list, entries_count) do
    ones_count = Enum.count(list, fn x -> x == "1" end)
    if(ones_count > entries_count / 2) do
      "1"
    else
      "0"
    end
  end

  def convert_bit_to_epsilon_bit(list, entries_count) do
    zeros_count = Enum.count(list, fn x -> x == "0" end)
    if(zeros_count > entries_count / 2) do
      "1"
    else
      "0"
    end
  end

end
