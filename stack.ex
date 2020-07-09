# stack.ex

defmodule Stack do
  use GenServer

  def init(initial_state \\ []) do
    {:ok, initial_state}
  end

  def handle_cast({:put, item}, state) do
    new_state = [item | state]
    {:noreply, new_state}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end
end

# {:ok, pid} = GenServer.start(Stack, [1, 2, 3])
# GenServer.cast(pid, {:put, 4})
# GenServer.call(pid, :pop)
# GenServer.call(pid, :pop)
