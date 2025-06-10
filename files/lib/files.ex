defmodule Files do
  def main() do
    start()
  end

  def start() do
    IO.gets("Do you want create a file or directory or nothing? (f/d/n): ")
    |> String.trim()
    |> String.downcase()
    |> handle_request()
  end

  def handle_request(request) do
    case request do
      "f" -> get_name() |> create_file()
      "d" -> get_name() |> create_dir()
      "n" -> IO.puts("Bye!")
      _ -> IO.puts("Invalid request") && start()
    end

    is_continued()
    :ok
  end

  def get_name() do
    name = IO.gets("Enter the name path: ")
    |> String.trim()
    |> String.replace("~", System.get_env("HOME"))

    name
  end

  def is_continued() do
    is_continued = IO.gets("Other file or directory? (y/n): ")
    |> String.trim()
    |> String.downcase()

    case is_continued do
      "y" -> start()
      "n" -> IO.puts("Bye!")
    end
  end

  def create_dir(path) do
    File.mkdir_p(path)
  end

  def create_file(path) do
    File.touch(path)
  end

  def remove(path) do
    File.rm_rf(path)
  end
end
