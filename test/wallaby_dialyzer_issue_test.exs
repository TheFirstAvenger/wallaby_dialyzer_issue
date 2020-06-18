defmodule WallabyDialyzerIssueTest do
  use ExUnit.Case
  doctest WallabyDialyzerIssue

  test "greets the world" do
    {:ok, session} = Wallaby.start_session()
  end
end
