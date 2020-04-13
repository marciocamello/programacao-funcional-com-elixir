defmodule FriendsApp.DB.CSV.Update do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.DB.CSV, as: CSV

  def update do
    Shell.cmd("clear")

    CSV.prompt_message("Type your friend mail to upate")
    |> CSV.search_friend_by_email()
    |> CSV.check_friend_found()
    |> confirm_update()
    |> do_update()
  end

  defp confirm_update(friend) do
    Shell.cmd("clear")
    Shell.info("Found friend...")

    CSV.show_friend(friend)

    case Shell.yes?("You are confirm to update this friend from list?") do
      true -> friend
      false -> :error
    end
  end

  defp do_update(friend) do
    Shell.cmd("clear")
    Shell.info("Now type new data to your friend...")

    updated_friend = CSV.collect_data()

    CSV.get_struct_list_from_csv()
    |> CSV.delete_friend_from_struct_list(friend)
    |> CSV.friend_list_to_csv()
    |> CSV.prepare_list_to_save_csv()
    |> CSV.save_csv_file()

    updated_friend
    |> CSV.transform_on_wrapped_list()
    |> CSV.prepare_list_to_save_csv()
    |> CSV.save_csv_file([:append])

    Shell.info("Friend updated with success!")
    Shell.prompt("Press enter to continue")
  end
end
