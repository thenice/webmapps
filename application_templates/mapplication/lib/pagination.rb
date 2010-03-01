module Pagination # to be extended or included as class methods...
  
  def paginate(options = {})
    begin
      select = options[:select] || "*"
      items_per_page = (options[:items_per_page].to_i > 0) ? (options[:items_per_page].to_i) : 10
      count = self.count.to_i
      number_of_pages = ((count % items_per_page) > 0) ? (count / items_per_page)+1 : (count / items_per_page)   
      page = (options[:current_page].to_i > 0) ? options[:current_page].to_i : 1
      offset = (page * items_per_page) - items_per_page
      rows = self.find(:all, :limit => items_per_page, :offset => offset, :select => select)
      results = {:count => count, :pages => number_of_pages, :current_page => page, :items => rows}
    rescue
      results = {:error => 'Error paginating.'}
    ensure
      return results
    end    
  end
  
end
