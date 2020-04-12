# First Class Functions

- basic_fee = fn price -> 5 end
- promotional_fee = fn price -> price + 0.12 end
- total_price = fn price fee -> price + fee.(price) end

```
basic_fee.(1234567)
promotional_fee.(100)
total_price.(1000, basic_fee)
total_price.(1000, promotional_fee)
```