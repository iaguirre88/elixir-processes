defmodule HotCode do
  def counter(state) do
    receive do
      :update ->
        HotCode.counter(state)

      {:get, caller} ->
        send(caller, state)
        counter(state)

      :inc ->
        counter(state * 2)
    end
  end
end
