defmodule Events.AccountsTest do
  use ExUnit.Case, async: true
  alias Events.Accounts

  describe "list_users/0" do
    test "returns a list of users" do
      users = Accounts.list_users()

      assert is_list(users)
      assert length(users) == 3
      first_user = %Accounts.User{id: "1", name: "Guille", username: "user1"}
      assert first_user in users
    end
  end

  describe "get_user/1" do
    test "returns the user with the given id" do
      user = Accounts.get_user("1")

      assert user.id == "1"
      assert user.name == "Guille"
      assert user.username == "user1"
    end

    test "returns nil if no user with the given id is found" do
      assert Accounts.get_user("999") == nil
    end
  end

  describe "get_user_by/1" do
    test "returns the user with the given params" do
      user = Accounts.get_user_by(%{name: "Guille"})

      assert user.id == "1"
      assert user.name == "Guille"
      assert user.username == "user1"
    end

    test "returns nil if no user matches the given params" do
      assert Accounts.get_user_by(%{name: "NonExistent"}) == nil
    end
  end
end
