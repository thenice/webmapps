module Sproutcorify
  
  # accepted options:
  # :find => a find options hash
  #
  # defaults to find all records with all fields included
    
  def self.to_sproutcore(options = {})
    sproutcore_json(get_records(options[:find]))
  end
  
  private
  
  def get_records(find_option)
    unless find_option.blank?
      records = self.find(:find => find_option)
    else
      records = self.find(:all)
    end
    records.collect { |r| r.attributes }
  end
  
  def sproutcore_json(records)
    {  :records => records,
        :ids => records.map(&:id),
        :count => records.size
    }.to_json
  end
  
end
