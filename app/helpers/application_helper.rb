# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def dashboard_tabs(current_tab = "dashboard")
    tabs = ['dashboard', 'projects', 'groups'].collect { |tab|
      if tab.include?(current_tab)
        '<li class = "selected_tab"><a href = "/dashboard/' + tab + '">' + tab + '</a></li>'
      else
        '<li><a href = "/dashboard/' + tab + '">' + tab + '</a></li>'
      end
    }.join
  end
  
  def project_tabs(current_tab = 'overview')
    tabs = ['overview', 'layers', 'publishing', 'sharing'].collect { |tab|
      if tab.include? current_tab
        '<li class = "selected_tab">' + tab + '</li>'
      else
        '<li>' + link_to(tab, :action => tab, :id => @project.id ) + '</li>'
      end
    }.join 
  end
  
  def show_pane
  end
  
  #rjs methods
  def say_hi(page)
    page.alert("hello there!")
  end
    
  def show_messages(page)
    if flash[:error]
      page.replace_html :messages, :partial => 'flash/error'
    elsif flash[:notice]
      page.replace_html :messages, :partial => 'flash/notice'
    elsif flash[:message]
      page.replace_html :messages, :partial => 'flash/message'
    end  
  end
  
  def pane_tab_html(selected)
  end
  
  def icon(options = {})
    options[:name] = title_match(options[:title]) if options.include? :title
    case options[:size]
      when :small then
        if not options.include? :gis
          image_tag "icons/general/16/#{options[:name]}", :class => 'icon'
        else
          image_tag "icons/gis/16/#{options[:type]}/#{options[:name]}", :class => 'gis_icon'
        end
      when :medium then
        if not options.include? :gis
          image_tag "icons/general/48/#{options[:name]}", :class => 'icon'
        else
          image_tag "icons/gis/48/#{options[:type]}/#{options[:name]}", :class => 'gis_icon'
        end
      when :large then
        if not options.include? :gis
          image_tag "icons/general/128/#{options[:name]}", :class => 'icon'
        else
          image_tag "icons/gis/128/#{options[:type]}/#{options[:name]}", :class => 'gis_icon'
        end
      when :jumbo then
        if not options.include? :gis
          image_tag "icons/general/256/#{options[:name]}", :class => 'icon'
        else
          image_tag "icons/gis/256/#{options[:type]}/#{options[:name]}", :class => 'gis_icon'
        end
      end
    end
  
  def title_match(title)
    case title
      when :megaphone then '001.png'
      when :caution then '002.png'
      when :red_flag then '003.png'
      when :lock then '004.png'
      when :clipboard then '005.png'
      when :information then '006.png'
      when :shopping_basket then '007.png'
      when :text then '008.png'
      when :burn then '009.png'
      when :calendar then '010.png'
      when :new_file then '043.png'
      when :group then '108.png'
      when :user then '056.png'
      when :editing then '043.png'
      when :key then '061.png'
      when :tools then '095.png'
      when :package then '046.png'
      when :globe then '057.png'
      when :new_file then '078.png'
    end
  end
 
end
