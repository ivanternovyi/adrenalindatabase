module NavigationHelpers
  def path_to(page_name)
    case page_name
    when /the\shome\s?page/
      '/'
    when /login\spage/
      '/users/sign_in'
    when /towns\spage/
      '/towns'
    when /new\suser\spage/
      '/users/new'
    when /new\strip\spage/
      '/trips/new'
    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end

  def path_to_show(page_name, page_id)
    case page_name
    when /view\suser\spage/
      '/users/' + page_id.to_s
    else
      raise "Can't find page #{page_name} with id #{page_id}" +
          "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)