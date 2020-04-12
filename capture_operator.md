# Capture Operator

- sum = fn (a, b) -> a + b end

Same result

- sum = &(&1 + &2) or sum = & &1 + &2

- abc - fn string -> String.upcase(string) end
- abc.("elixir)

- abc = &String.upcase/1
- abc.("hello, world")