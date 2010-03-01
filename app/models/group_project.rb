class GroupProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :group
end
