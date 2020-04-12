defmodule Salary do
    def bonus_calculate(percentage) do
        fn(salary) -> salary * percentage end
    end
end

# bonus_manager = Salary.bonus_calculate(1.05)
# bonus_manager.(1000)

# Salary.bonus_calculate(1.05).(1000)