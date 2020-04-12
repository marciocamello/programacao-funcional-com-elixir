total = 876

defmodule Mutator do
    def mutate(value) do
        value = 1
        IO.puts "intern - #{value}" # Here are show 1 or 876?
        value
    end
end

Mutator.mutate(total)
IO.puts "extern A- #{total}" # And here? 1 or 876?

total = Mutator.mutate(total)
IO.puts "extern B- #{total}" # And here? 1 or 876?