defmodule FriendsApp do
  @moduledoc """
  Documentation for `FriendsApp`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> FriendsApp.hello()
      :world

  """
  def hello do
    :world
  end

  def my_env do
    case Mix.env() do
      :prod -> "Production"
      :dev -> "Development"
      :test -> "Test"
    end
  end
end
