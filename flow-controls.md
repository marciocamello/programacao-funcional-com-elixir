# Flow Controlls

- if

```
x = 10
if x == 10 do
end

 if true, do: 1 + 2

 if false, do: :tiago, else: :joao
```

- unless

```
unless x == 10 do
"x is not 10"
else
"x is 10"
end
```

- cond

```
cond do
2 + 4 == 5 -> "It's not truth"
2 + 3 == 6 -> "It's too not truth"
2 + 2 == 4 -> "Ok, you win!"
 end
```

- case

```
case :tobias do
:manoel -> "That's are not :tobias"
10 -> "It's almost less"
:junior -> "I'am so tired"
:tobias -> ":tobias equal to :tobias"
end

case {1,2,3} do.{1,x,3} when x > 0 -> "Is more then zero"
_ -> "Default case result"
end
```