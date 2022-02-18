class BoardBlueprint < Blueprinter::Base
  identifier :id

  view :normal do
    fields :title, :date
  end
end
