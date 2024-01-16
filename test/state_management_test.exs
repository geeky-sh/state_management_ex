defmodule StateManagementTest do
  use ExUnit.Case
  doctest StateManagement

  test "greets the world" do
    assert StateManagement.hello() == :world
  end
end
