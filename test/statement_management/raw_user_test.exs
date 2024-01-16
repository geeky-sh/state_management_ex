defmodule StatementManagement.RawUserTest do
  alias File.Stat
  use ExUnit.Case

  test "Test Raw User" do
    StateManagement.RawUser.start()

    StateManagement.RawUser.add("aash", "aash.discover@gmail.com")
    assert StateManagement.RawUser.count() == 1

    StateManagement.RawUser.add("raj", "raj@rediffmail.com")
    assert StateManagement.RawUser.count() == 2

    StateManagement.RawUser.remove("raj@rediffmail.com")
    assert StateManagement.RawUser.count() == 1
  end
end
