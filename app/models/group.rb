class Group < ActiveRecord::Base
  has_many :group_memberships
  has_many :users, :through => :group_memberships
  
  has_many :group_projects
  has_many :projects, :through => :group_projects
  
  def <=>(other)
    self.name <=> other.name
  end
end
