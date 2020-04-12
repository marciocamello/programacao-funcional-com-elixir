# Pattern Matching

- {a, b, c} = {:hello, "World", 20}

- {a, b, c} = {:hello, "World"} # Error match
- {a, b, c} = [:hello, "World", 20] # Error match

- [head | tail] = [1, 2, 3]

# Undescore

- {x, y} = {32, 25}
- {x, _} = {40, 25}

# Pin Operator

- x = 21
- x = 43
- ^x = 45
- {x, ^y} = {12, 89}

# Matching String

- "elixir" <> "is cool"
- "Content-Type: " <> content_type = "Content-Type: text/html; charset=UTF-
8"