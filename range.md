# Ranges

- range = 1..5  
- Enum.map(range, fn n -> n * 2 end)
- Enum.map(range, &(&1*2))

# Enum.take

- Enum.take(range, 3)
- 1..9 |> Enum.take(3)
- Enum.map(1..5_000_000, &(&1)) |> Enum.take(10)

# Lazy Evaluation

- Stream.map(1..5_000_000, &(&1)) |> Enum.take(10)