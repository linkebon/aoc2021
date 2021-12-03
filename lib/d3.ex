defmodule D3 do

  def one() do
    input = Read_File_Utils.read_file("d3.txt")
            |> Enum.map(&String.graphemes/1)

    entries_count = Enum.count(input)

    gamma = input
            |> Enum.zip()
            |> Enum.map(&Tuple.to_list/1)
            |> Enum.map(&convert_bit_to_gamma_bit(&1, entries_count))
            |> Enum.join()
            |> String.to_integer(2)

    epsilon = input
              |> Enum.zip()
              |> Enum.map(&Tuple.to_list/1)
              |> Enum.map(&convert_bit_to_epsilon_bit(&1, entries_count))
              |> Enum.join()
              |> String.to_integer(2)

    epsilon * gamma
  end

  def convert_bit_to_gamma_bit(list, entries_count) do
    ones_count = Enum.count(list, fn x -> x == "1" end)
                 |> IO.inspect(label: "ones count")
    zero_count = Enum.count(list, fn x -> x == "0" end)
                 |> IO.inspect(label: "zero count")

    if(ones_count == zero_count) do
      "1"
    else
      if(ones_count > entries_count / 2) do
        "1"
      else
        "0"
      end

    end
  end

  def convert_bit_to_epsilon_bit(list, entries_count) do
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

  def two() do
    input = Read_File_Utils.read_file("d3.txt")
            |> Enum.map(&String.graphemes/1)

    o2 = calc_o2(input)
         |> String.to_integer(2)
         |> IO.inspect(label: "co2")
    co2 = calc_co2(input)
          |> String.to_integer(2)
          |> IO.inspect(label: "co2")
    co2 * o2
  end

  def calc_o2(binaries, bit \\ 0) do
    IO.inspect(binaries, label: "start")
    IO.inspect("bit: #{bit}")
    if(Enum.count(binaries) == 1) do
      Enum.at(binaries, 0)
      |> Enum.join()
    else
      entries = Enum.count(binaries)
      structured = binaries
                   |> Enum.zip()
                   |> Enum.map(&Tuple.to_list/1)
                   |> IO.inspect(label: "structured")

      bit_to_save = convert_bit_to_gamma_bit(Enum.at(structured, bit), entries)
                    |> IO.inspect(label: "to save")

      calc_o2(
        Enum.filter(binaries, fn row -> Enum.at(row, bit) == bit_to_save end)
        |> IO.inspect(),
        bit + 1
      )
    end
  end

  def calc_co2(binaries, bit \\ 0) do
    IO.inspect(binaries, label: "start")
    IO.inspect("bit: #{bit}")
    if(Enum.count(binaries) == 1) do
      Enum.at(binaries, 0)
      |> IO.inspect(label: "ttt")
      |> Enum.join()
    else
      entries = Enum.count(binaries)
      structured = binaries
                   |> Enum.zip()
                   |> Enum.map(&Tuple.to_list/1)

      bit_to_save = convert_bit_to_epsilon_bit(Enum.at(structured, bit), entries)
                    |> IO.inspect(label: "to save")

      calc_co2(
        Enum.filter(binaries, fn row -> Enum.at(row, bit) == bit_to_save end)
        |> IO.inspect(),
        bit + 1
      )
    end
  end
end
