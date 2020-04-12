# Pipe operator

- IO.puts(String.length("Hello"))

- srt_lent = String.length("Hello")
- IO.puts(srt_lent)

- String.length("Hello") |> IO.puts
- "Hello" |> String.length |> IO.puts

```
"Hello"
|> String.length
|> IO.puts
```