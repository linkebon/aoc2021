defmodule D3 do

  def one() do
    input = Read_File_Utils.read_file("d3.txt")
            |> Enum.map(&String.graphemes/1)

    entries_count = Enum.count(input)

    gamma = input
            |> Enum.zip()
            |> Enum.map(&Tuple.to_list/1)
            |> Enum.map(&find_most_common_bit(&1))
            |> Enum.join()
            |> String.to_integer(2)

    epsilon = input
              |> Enum.zip()
              |> Enum.map(&Tuple.to_list/1)
              |> Enum.map(&find_least_common_bit(&1))
              |> Enum.join()
              |> String.to_integer(2)

    epsilon * gamma
  end

  def two() do
    input = Read_File_Utils.read_file("d3.txt")
            |> Enum.map(&String.graphemes/1)

    o2 = calc_ratings(input, &find_most_common_bit/1)
         |> String.to_integer(2)
    co2 = calc_ratings(input, &find_least_common_bit/1)
          |> String.to_integer(2)
    co2 * o2
  end

  def calc_ratings(binaries, calc_function, bit \\ 0) do
    if(Enum.count(binaries) == 1) do
      Enum.at(binaries, 0)
      |> Enum.join()
    else
      entries = Enum.count(binaries)
      structured = binaries
                   |> Enum.zip()
                   |> Enum.map(&Tuple.to_list/1)

      bit_to_save = calc_function.(Enum.at(structured, bit))

      calc_ratings(
        Enum.filter(binaries, fn row -> Enum.at(row, bit) == bit_to_save end),
        calc_function,
        bit + 1
      )
    end
  end

  def find_most_common_bit(list) do
    ones_count = Enum.count(list, fn x -> x == "1" end)
    zero_count = Enum.count(list, fn x -> x == "0" end)

    if(ones_count == zero_count) do
      "1"
    else
      if(ones_count > zero_count) do
        "1"
      else
        "0"
      end

    end
  end

  def find_least_common_bit(list) do
    zeros_count = Enum.count(list, fn x -> x == "0" end)
    ones_count = Enum.count(list, fn x -> x == "1" end)

    if(zeros_count == ones_count) do
      "0"
    else
      if(zeros_count > ones_count) do
        "1"
      else
        "0"
      end
    end
  end
end
