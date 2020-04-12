fact_gen = fn me ->
   fn
     0 -> 1
     x when x > 0 -> x * me.(me).(x - 1)
   end
end