# AOC 2021 in elixir and python
# run module function
1. iex -S mix
2. D1.one()

#recompile
r D1

# get columns in matrix as rows
Enum.zip([[1,2,3,4,5], [6,7,8,9,10],[11,12,13,14]]) |> Enum.map(&Tuple.to_list/1)
[[1, 6, 11], [2, 7, 12], [3, 8, 13], [4, 9, 14]]