defmodule FilesTest do
  use ExUnit.Case
  doctest Files

  test "test create_dir" do
    assert Files.create_dir("prova_test") == :ok
  end

  test "test create_file" do
    assert Files.create_file("prova_test/prova_test.txt") == :ok
  end

  # test "test remove" do
  #   assert Files.remove("prova_test") == :ok
  # end
end
