defmodule State do
  def counter(number) do
    receive do
      :inc ->
        counter(number + 1)

      {:get, caller} ->
        send(caller, number)
        counter(number)
    end
  end
end

# pid = spawn(State, :counter, [0])
# send(pid, {:get, self()})
# flush()

# send(pid, :inc)
# send(pid, :inc)
# send(pid, :inc)

# send(pid, {:get, self()})
# flush()
