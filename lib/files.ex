defmodule Files do
  def messages_from_folder(path) do
    Path.wildcard(Path.join(Path.absname(path), "*.msg"))
    |> Enum.map(&load_message(&1))
  end

  def load_message(message_name) do
    case message_name do
      [] ->
        nil
      _ ->
        message = File.read(message_name)
        info = String.split(message_name, ".")
        %{
          documentType: Path.basename(Enum.at(info, 0)),
          sender: Enum.at(info, 1),
          receiver: Enum.at(info, 2),
          msgNumber: Enum.at(info, 3),
          numVersion: Enum.at(info, 4),
          messageFormat: Enum.at(info, 5),
          signed: Enum.at(info, 6),
          message: message
        }
    end
  end
end
