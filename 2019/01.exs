defmodule Main do

  def calcWeight(w) do
    remaining = Float.floor(w / 3) - 2
    cond do
      remaining <= 0 -> 0
      true -> remaining + calcWeight(remaining)
    end
  end

  def read_file(path) do
    {:ok, contents} = File.read(path)
    contents
    |> String.split("\n")
    |> Enum.filter(fn (x) -> x != "" end)
    |> Enum.reduce(%{sum1: 0, sum2: 0}, fn (x, acc) ->
      {weight, _} = Integer.parse(x)

      weight1 = Float.floor(weight / 3) - 2
      weight2 = calcWeight(weight)
      sum1 = weight1 + acc[:sum1]
      sum2 = weight2 + acc[:sum2]
      %{sum1: sum1, sum2: sum2}
    end)
  end

  def process do
    %{sum1: sum1, sum2: sum2} = read_file("01.txt")
    IO.puts "Sum 1: #{sum1}, Sum 2: #{sum2}"
  end
end

Main.process
