defmodule FriendsApp.DB.CSV do
  alias Mix.Shell.IO, as: Shell
  alias FriendsApp.CLI.Menu
  alias FriendsApp.CLI.Friend
  alias FriendsApp.DB.CSV
  alias FriendsApp.DB.CSV.Create
  alias FriendsApp.DB.CSV.Update
  alias FriendsApp.DB.CSV.Read
  alias FriendsApp.DB.CSV.Delete
  alias NimbleCSV.RFC4180, as: CSVParser

  def perform(chosen_menu_item) do
    case chosen_menu_item do
      %Menu{id: :create, label: _} -> Create.create()
      %Menu{id: :read, label: _} -> Read.read()
      %Menu{id: :update, label: _} -> Update.update()
      %Menu{id: :delete, label: _} -> Delete.delete()
    end

    Menu.Choice.start()
  end

  def search_friend_by_email(email) do
    get_struct_list_from_csv()
    |> Enum.find(:not_found, fn list ->
      list.email == email
    end)
  end

  def check_friend_found(friend) do
    case friend do
      :not_found ->
        Shell.cmd("clear")
        Shell.error("Friend not found")
        Shell.prompt("Press enter to continue")
        Menu.Choice.start()

      _ ->
        friend
    end
  end

  def show_friend(friend) do
    friend
    |> Scribe.print(data: [{"Name", :name}, {"Email", :email}, {"Phone", :phone}])
  end

  def friend_list_to_csv(list) do
    list
    |> Enum.map(fn item ->
      [item.email, item.name, item.phone]
    end)
  end

  def get_struct_list_from_csv do
    read_csv_file()
    |> parse_csv_file_to_list()
    |> csv_list_fro_friend_struct_list()
  end

  def delete_friend_from_struct_list(list, friend) do
    list
    |> Enum.reject(fn elem -> elem.email == friend.email end)
  end

  defp read_csv_file do
    Application.fetch_env!(:friends_app, :csv_file_path)
    |> File.read!()
  end

  defp parse_csv_file_to_list(csv_file) do
    csv_file
    |> CSVParser.parse_string(skip_headers: false)
  end

  defp csv_list_fro_friend_struct_list(list) do
    list
    |> Enum.map(fn [email, name, phone] ->
      %Friend{name: name, email: email, phone: phone}
    end)
  end

  def show_friends(friends_list) do
    friends_list
    |> Scribe.console(data: [{"Name", :name}, {"Email", :email}, {"Phone", :phone}])
  end

  def collect_data do
    Shell.cmd("clear")

    %Friend{
      name: prompt_message("Type name:"),
      email: prompt_message("Type email:"),
      phone: prompt_message("Type phone:")
    }
  end

  def prompt_message(message) do
    Shell.prompt(message)
    |> String.trim()
  end

  def transform_on_wrapped_list(struct) do
    struct
    |> Map.from_struct()
    |> Map.values()
    |> wrap_in_list()
  end

  defp wrap_in_list(list) do
    [list]
  end

  def prepare_list_to_save_csv(list) do
    list
    |> CSVParser.dump_to_iodata()
  end

  def save_csv_file(data, mode \\ []) do
    Application.fetch_env!(:friends_app, :csv_file_path)
    |> File.write!(data, mode)
  end
end
