defmodule Events.Accounts do
  @moduledoc """
  The Accounts context.
  """
  alias Events.Accounts.User

  def list_users do
    [
      %User{id: "1", name: "Guille", username: "user1"},
      %User{id: "2", name: "David", username: "user2"},
      %User{id: "3", name: "Mark", username: "user3"}
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), fn map -> map.id == id end)
  end

  def get_user_by(params) do
    Enum.find(list_users(), fn map ->
      Enum.all?(params, fn {key, val} ->
        Map.get(map, key) == val
      end)
    end)
  end
end
