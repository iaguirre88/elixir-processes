defmodule Consumer do
  def process_message() do
    receive do
      :hello -> IO.puts("Hello world!")
      :bye -> IO.puts("Good bye")
      _ -> IO.puts("No idea how to handle this")
    after
      10_000 -> IO.puts("Didn't get anything")
    end
  end
end

# pid = spawn(Consumer, :process_message, [])
# send(pid, :bye)

# pid = spawn(Consumer, :process_message, [])
# send(pid, :random)
