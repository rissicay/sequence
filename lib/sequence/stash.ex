defmodule Sequence.Stash do
  use GenServer

  # External Api

  def start_link(current_number) do
    IO.puts "Starting stash"
    {:ok, _pid} = GenServer.start_link(__MODULE__, current_number)
  end

  def get_value(pid) do
    GenServer.call pid, :get_value
  end

  def save_value(pid, value) do
    GenServer.cast pid, {:save_value, value}
  end

  # GenServer implementation

  def handle_call(:get_value, _from, current_number) do
    {:reply, current_number, current_number }
  end

  def handle_cast({:save_value, value}, _from, _current_number) do
    {:noreply, value}
  end
end
