defmodule User do
    @enforce_keys [:name]
    defstruct name: nil, age: nil 
end