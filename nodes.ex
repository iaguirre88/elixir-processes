defmodule DistributedConsumer do
  def process_message(parent) do
    receive do
      _ -> send(parent, "Hello world!")
    end
  end
end

# iex --sname node1@localhost
# iex --sname node2@localhost

# pid = Node.spawn(:node2@localhost, DistributedConsumer, :process_message, [self()])

# :observer.start
