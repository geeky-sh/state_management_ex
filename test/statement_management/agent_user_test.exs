defmodule StatementManagement.AgentUserTest do
  alias File.Stat
  use ExUnit.Case

  test "Test User using the Agent utils provided for state management" do
    StateManagement.AgentUser.start()

    StateManagement.AgentUser.add("aash", "aash.discover@gmail.com")
    assert StateManagement.AgentUser.count() == 1

    StateManagement.AgentUser.add("raj", "raj@rediffmail.com")
    assert StateManagement.AgentUser.count() == 2

    StateManagement.AgentUser.remove("raj@rediffmail.com")
    assert StateManagement.AgentUser.count() == 1
  end
end
