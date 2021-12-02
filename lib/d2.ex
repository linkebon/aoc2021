defmodule D2 do

  def one() do
    Read_File_Utils.read_file("d2.txt")
    |> Enum.map(fn x -> String.split(x, ~r/\s/) end)
    |> Enum.map(fn [first, second] -> [first, String.to_integer(second)] end)
    |> Enum.reduce(
         {0, 0},
         fn instruction,
            acc -> handle_instruction(instruction, acc)
         end
       )
    |> (fn {x, y} -> x * y end).()
  end

  def handle_instruction(instruction, position) do
    case instruction do
      ["forward", number] ->
        {elem(position, 0) + number, elem(position, 1)}
        |> IO.inspect(label: "forward")

      ["down", number] ->
        {elem(position, 0), elem(position, 1) + number}
        |> IO.inspect(label: "down")

      ["up", number] ->
        {elem(position, 0), elem(position, 1) - number}
        |> IO.inspect(label: "up")

      [dir, number] ->
        IO.puts("should not:" <> dir <> ":" <> number <> "\n")

    end
  end

  def handle_instruction_with_aim(instruction, position) do
    case instruction do
      ["forward", number] ->
        horizontal_pos = (elem(position, 0) + number)
        depth = elem(position, 1) + (elem(position, 2) * number)
        {horizontal_pos, depth, elem(position, 2)}

      ["down", number] -> {elem(position, 0), elem(position, 1), elem(position, 2) + number}

      ["up", number] -> {elem(position, 0), elem(position, 1), elem(position, 2) - number}
    end
  end

  def two() do
    Read_File_Utils.read_file("d2.txt")
    |> Enum.map(fn x -> String.split(x, ~r/\s/) end)
    |> Enum.map(fn [first, second] -> [first, String.to_integer(second)] end)
    |> Enum.reduce(
         {0, 0, 0},
         fn instruction,
            acc -> handle_instruction_with_aim(instruction, acc)
         end
       )
    |> (fn {x, y, _} -> x * y end).()
  end

end
