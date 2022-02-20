class ItemBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :board_id, :done
end
