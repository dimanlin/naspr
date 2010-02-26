module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /new user/
      '/users/new'

    when /new debates/
      "/debates/new"

    when /debates/
      "/debates"

    when /page contacts/
      "/contacts"

    when /page advertising/
      "/page/advertising"

    when /the debate search/
      '/debates/search'

    when /the recoverpassword/
      '/users/newpassword?key=876asd5f76x57x657zx65v7z6xc'

    when /the wrong recover link/
      '/users/newpassword?key=879s8df79s8df79s8df79s8df7s9d8'



    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)

