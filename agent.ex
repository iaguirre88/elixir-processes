{:ok, agent} = Agent.start(fn -> [] end)

Agent.update(agent, fn old_state -> ["eggs" | old_state] end)

Agent.get(agent, fn state -> state end)

Agent.update(agent, fn old_state -> ["milk" | old_state] end)

Agent.get(agent, fn state -> Enum.reverse(state) end)
Agent.get(agent, fn state -> state end) |> Enum.reverse
