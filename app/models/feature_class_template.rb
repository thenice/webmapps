class FeatureClassTemplate < ActiveRecord::Base
  set_table_name table_name
  acts_as_spatial
  extend Pagination
end