defmodule Read_File_Utils do
  @folder_prefix "input/"
  def read_file(file), do: @folder_prefix <> file
                           |> File.read!()
                           |> String.split(~r{(\n)+})

  def read_file(file, split_regexp), do: @folder_prefix <> file
                                         |> File.read!()
                                         |> String.split(split_regexp)

  def map_list_to_int(list), do: Enum.map(list, &String.to_integer/1)

end
