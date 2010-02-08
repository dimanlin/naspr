Breadcrumb.configure do
  dont_link_last_crumb
  # Specify name, link title and the URL to link to
  crumb :profile, "Your Profile", :account_url
  crumb :root, "Главная", :root_url
  crumb :debate, "Новый спор", :new_debate_url

  # Specify controller, action, and an array of the crumbs you specified above
  trail :debates, :new, [:root, :debate]
  trail :accounts, :show, [:root, :profile]
  trail :home, :index, [:root]

  # Specify the delimiter for the crumbs
  delimit_with " > "
end

