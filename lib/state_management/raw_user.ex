defmodule StateManagement.RawUser do
  @name :raw_user
  defstruct username: "", email: "", joined_at: nil

  def start do
    pid = spawn(__MODULE__, :loop, [[]])
    Process.register(pid, @name)
  end

  def loop(state) do
    receive do
      {pid, :add, item} ->
        new_state = [item | state]
        send(pid, new_state)
        loop(new_state)
      {pid, :remove, remove_email} ->
        IO.inspect(remove_email)
        new_state =
          state
          |> Enum.reject(
            fn (%StateManagement.RawUser{username: _username, email: email, joined_at: _joined_at}) -> remove_email == email  end
            )

        send(pid, new_state)
        loop(new_state)
      {pid, :list, nil} ->
        send(pid, state)
        loop(state)
      {pid, :count, nil} ->
        send(pid, length(state))
        loop(state)
    end
  end

  def exec(operation, data \\ nil) do
    send(@name, {self(), operation, data})
    receive do
      val -> val
    end
  end

  def add(username, email) do
    item = %StateManagement.RawUser{username: username, email: email, joined_at: DateTime.utc_now()}
    exec(:add, item)
  end

  def remove(email) do
    exec(:remove, email)
  end

  def list() do
    exec(:list)
  end

  def count() do
    exec(:count)
  end
end
