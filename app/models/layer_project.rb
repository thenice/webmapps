class LayerProject < ActiveRecord::Base
  belongs_to :layer
  belongs_to :project
end
