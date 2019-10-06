defmodule FilesTest do
  use ExUnit.Case

  import Files

  test "no path" do
    files = messages_from_folder("messages")
    case files do
      [_x | _] -> assert false
      _ -> assert true
    end
  end

  test "one message" do
    files = messages_from_folder("messages/VGM/ACEPTACION")
    case files do
      [_x | _] -> assert true
      _ -> assert false
    end
  end

  test "more than one message" do
    files = messages_from_folder("messages/TRANSPORTIC")
    assert Enum.count(files) == 2
  end

  test "more than one message and right document type" do
    files = messages_from_folder("messages/TRANSPORTIC")
    assert Enum.count(Enum.filter(files, fn f -> String.starts_with?(f.documentType, "IFTMINCS") end)) == 2
  end
end
