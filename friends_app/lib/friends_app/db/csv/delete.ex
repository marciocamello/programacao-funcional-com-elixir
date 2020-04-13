defmodule FriendsApp.DB.CSV.Delete do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.DB.CSV, as: CSV

  def delete do
    Shell.cmd("clear")

    CSV.prompt_message("Type your friend mail to delete")
    |> CSV.search_friend_by_email()
    |> CSV.check_friend_found()
    |> confirm_delete()
    |> delete_and_save()
  end

  defp confirm_delete(friend) do
    Shell.cmd("clear")
    Shell.info("Found friend...")

    CSV.show_friend(friend)

    case Shell.yes?("You are confirm to remove this friend from list?") do
      true -> friend
      false -> :error
    end
  end

  defp delete_and_save(friend) do
    case friend do
      :error ->
        Shell.info("Ok, this friend can't removed...")
        Shell.prompt("Press enter to continue")

      _ ->
        CSV.get_struct_list_from_csv()
        |> CSV.delete_friend_from_struct_list(friend)
        |> CSV.friend_list_to_csv()
        |> CSV.prepare_list_to_save_csv()
        |> CSV.save_csv_file()

        Shell.info("Friend removed with success!")
        Shell.prompt("Press enter to continue")
    end
  end
end
