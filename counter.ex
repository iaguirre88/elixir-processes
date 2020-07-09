defmodule Counter do
  def start(initial_value) do
    {:ok, pid} = Agent.start(fn -> initial_value end)
    pid
  end

  def value(agent) do
    Agent.get(agent, fn state -> state end)
  end

  def increment(pid) do
    Agent.update(pid, fn state -> state + 1 end)
  end
end
