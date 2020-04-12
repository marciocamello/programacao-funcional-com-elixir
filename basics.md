# Basic Types

- integer       # 1
- float         # 1.0
- integer       # 0x1F
- boolean       # true
- atom /symbol  # :atom
- string        # "elixir"
- lis           # [1 , 2, 3]
- tuple         # {1, 2, 3}

# Integer and Floats

- div(10, 3)    # no decimal results
- rem(10, 3)    # dividend rest
- round(3.58)   # rounded number
- trunc(3.58)   # truncate number

# Binary, Hexadecimal and Octal

- 0b1010        # binary
- 0o755         # octal
- 0xFF          # hexadecimal

# Bollean

- true
- false

# Check Variables/Terms

- is_boolean/1
- is_atom/1
- is_integer/1
- is_float/1
- is_number/1

# Atoms

- is_atom

# Strings

- IO.puts "Elixir is cool"
- IO.puts "#{var} string"
- IO.puts "Hello" <> "World"

# Binaries, Strings and Charlists

- byte_size "Elixir is cool"
- String.length "Elixir is cool"

# Code points

- ?a    # 97        
- ?é    # 233

# Binary represent string

- "Elixir is cool!" <> <<0>>
- <<69, 108, 105, 120, 105, 114, 32, 105, 115, 32, 99, 111, 111, 108, 33, 0>>

# Charlists

- to_charlist "Pingüin"
- 'Pingüin'
- [80, 105, 110, 103, 252, 105, 110]

# Lists

- [:yes, 34, "Elixir"]
- [:yes, 34, "Elixir"] ++ [:no, 25, "Cool"]
- [:yes, 34, "Elixir"] -- [34, "Elixir"]
- hd [:yes, 34, "Elixir"]
- tail [:yes, 34, "Elixir"]

# Tuples

- tuple = {1, 2, 3, "Texto"}
- elem(tuple, 1)

# Imutable

- list = [1, 2, 3, 4]
- List.delete_at(list, -1)
- list ++ [1]
- IO.inspect list
