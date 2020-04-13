defmodule FriendsApp.DB.CSV.Create do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.DB.CSV, as: CSV

  def create do
    CSV.collect_data()
    |> CSV.transform_on_wrapped_list()
    |> CSV.prepare_list_to_save_csv()
    |> CSV.save_csv_file([:append])
  end
end
