defmodule Consumer do
  def process_message(parent) do
    receive do
      :hello -> send(parent, "Hello world!")
      :bye -> send(parent, "Good bye")
      _ -> send(parent, "No idea how to handle this")
    end
  end
end

# pid = spawn(Consumer, :process_message, [self()])
# send(pid, :bye)
# pid = spawn(Consumer, :process_message, [self()])
# send(pid, :random)

# flush()
