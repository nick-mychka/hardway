class ItemBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :title, :board_id, :done
  end
end
