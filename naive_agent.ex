defmodule NaiveAgent do
  def start(state) do
    spawn(fn -> loop(state) end)
  end

  def get(pid, fun) do
    send(pid, {:get, fun, self()})

    receive do
      msg -> msg
    end
  end

  def update(pid, fun) do
    send(pid, {:update, fun})
    :ok
  end

  defp loop(state) do
    receive do
      {:get, fun, caller} ->
        send(caller, fun.(state))
        loop(state)

      {:update, fun} ->
        state
        |> fun.()
        |> loop
    end
  end
end
