class MarathonBlueprint < Blueprinter::Base
  identifier :id

  fields :title, :date_from, :date_to, :cover_url
end
