defmodule StatementManagement.GenserverUserTest do
  use ExUnit.Case

  test "Test User using GenServer provided for state management" do
    StateManagement.GenserverUser.start()

    StateManagement.GenserverUser.add("aash", "aash.discover@gmail.com")
    assert StateManagement.GenserverUser.count() == 1

    StateManagement.GenserverUser.add("raj", "raj@rediffmail.com")
    assert StateManagement.GenserverUser.count() == 2

    StateManagement.GenserverUser.remove("raj@rediffmail.com")
    assert StateManagement.GenserverUser.count() == 1
  end
end
