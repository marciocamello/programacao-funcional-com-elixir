defmodule FriendsApp.DB.CSV do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.CLI.Menu
  alias FriendsApp.CLI.Friend
  alias NimbleCSV.RFC4180, as: CSVParser

  def perform(chosen_menu_item) do
    case chosen_menu_item do
      %Menu{id: :create, label: _} -> create()
      %Menu{id: :read, label: _} -> read()
      %Menu{id: :update, label: _} -> Shell.info(">>>> UPDATE <<<<")
      %Menu{id: :delete, label: _} -> Shell.info(">>>> DELETE <<<<")
    end

    Menu.Choice.start()
  end

  defp read do
    File.read!("#{File.cwd!}/friends.csv")
    |> CSVParser.parse_string(headers: false)
    |> Enum.map( fn [name, email, phone] -> 
      %{name: name, email: email, phone: phone}
    end)
    |> Scribe.console(data: [{"Name", :name}, {"Email", :email}, {"Phone", :phone }])
  end

  defp create do
    collect_data()
    |> Map.values()
    |> wrap_in_list()
    |> CSVParser.dump_to_iodata()
    |> save_csv_file()
  end

  defp collect_data do
    Shell.cmd("clear")

    %Friend{
      name: prompt_message("Type name:"),
      email: prompt_message("Type email:"),
      phone: prompt_message("Type phone:")
    }
  end

  defp prompt_message(message) do
    Shell.prompt(message)
    |> String.trim()
  end

  defp wrap_in_list(list) do
    [list]
  end

  defp save_csv_file(data) do
    Application.fetch_env!(:friends_app, :csv_file_path)
    |> File.write!(data, [:append])
  end
end
