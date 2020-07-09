defmodule Printer do
  def fun(x) do
    :timer.sleep(1)
    IO.puts("Value: #{x} -- Pid: #{inspect(self())}")
  end
end

# Enum.each(1..10, fn x -> spawn(Printer, :fun, [x]) end)
