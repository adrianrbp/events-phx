defmodule EventsWeb.UserView do
  use EventsWeb, :view

  alias Events.Accounts

  def first_name(%Accounts.User{name: name}) do
    # IO.puts(name)

    name
    # |> String.split('')
    # |> Enum.at(0)
  end
end
