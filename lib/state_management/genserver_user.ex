defmodule StateManagement.GenserverUser do
  use GenServer
  @name :gen_server_user
  defstruct username: "", email: ""

  def start do
    GenServer.start(__MODULE__, [], name: @name)
  end

  def add(username, email) do
    obj = %StateManagement.AgentUser{username: username, email: email}
    GenServer.cast(@name, {:add, obj})
  end

  def remove(email) do
    GenServer.cast(@name, {:remove, email})
  end


  def list() do
    GenServer.call(@name, :list)
  end

  def count() do
    list()
    |> length()
  end

  @impl true
  def init(init_arg) do
    {:ok, init_arg}
  end

  @impl true
  def handle_call(:list, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:add, obj}, state) do
    {:noreply, [obj | state]}
  end

  def handle_cast({:remove, email}, state) do
    new_state = state |> Enum.reject(&(&1.email == email))
    {:noreply, new_state}
  end
end
