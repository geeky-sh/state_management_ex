defmodule StateManagement.AgentUser do
  @name :agent_user
  defstruct username: "", email: ""

  def start() do
    Agent.start(fn -> [] end, name: @name)
  end

  def add(username, email) do
    obj = %StateManagement.AgentUser{username: username, email: email}
    Agent.update(@name, &([obj | &1]))
  end

  def remove(email) do
    Agent.update(@name, &(&1 |> Enum.reject(fn obj -> obj.email == email end)))
  end
  def list() do
    Agent.get(@name, &(&1))
  end

  def count() do
    list()
    |> length()
  end
end
