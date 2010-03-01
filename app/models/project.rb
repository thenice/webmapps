class Project < ActiveRecord::Base
  
  has_many :layer_projects
  has_many :layers, :through => :layer_projects
  
  has_many :group_projects
  has_many :groups, :through => :group_projects
  
  has_many :user_projects
  has_many :users, :through => :user_projects
  
  has_many :shared_projects
  
  belongs_to :owner, :class_name => 'User', :foreign_key => :owner_id
    
  def user_has_access?(user)
    self.users.include? user or (self.owner == user)
  end

  def <=>(other)
    self.title <=> other.title
  end
  
  def short_description
    if self.description.length > 500
      self.description[0..500] + "..."
    else self.description
    end
  end
  
end


