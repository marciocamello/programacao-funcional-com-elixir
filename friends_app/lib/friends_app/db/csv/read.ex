defmodule FriendsApp.DB.CSV.Read do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.DB.CSV, as: CSV

  def read do
    CSV.get_struct_list_from_csv()
    |> CSV.show_friends
  end
end
