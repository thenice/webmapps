class User < ActiveRecord::Base
  acts_as_authentic # authlogic lazy loading
  has_many :group_memberships
  has_many :groups, :through => :group_memberships
  has_many :layers
  has_many :shared_projects
  has_one :user_profile
  has_many :user_projects
  has_many :projects, :through => :user_projects
  
  after_create :create_user_profile
  
  def create_user_profile
    self.user_profile = UserProfile.new
    self.save
  end
  
  def my_projects
    Project.find_all_by_owner_id(self.id)
  end
  
  def all_projects
    self.projects + my_projects
  end
  
  def all_layers
    all_projects.collect { |p| p.layers }.flatten
  end
  
  def shared_projects
    self.projects
  end
  
  def <=>(other)
    self.username <=> other.username
  end
  
end
