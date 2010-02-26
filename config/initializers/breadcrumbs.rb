Breadcrumb.configure do
  dont_link_last_crumb
  # Specify name, link title and the URL to link to
  crumb :root, "Главная", :root_url
  crumb :new_debate, "Новый спор", :new_debate_url
  crumb :show_debate, "Спор/мнение", :new_debate_url
  crumb :debates_comments, "Спор/мнение", :debate_url, '@debate'
  crumb :index_debates, "Все споры", :debate_url
  crumb :new_comment, "Новый комментарий", :new_comment_url
  crumb :mydebates, "Мои споры/мнения", :mydebates_debates_url
  crumb :edit_user, "Мои настройки", :edit_users, '@users'
  crumb :new_user, "Регистрация", :new_user
  crumb :login, "Авторизация", :login_url
  crumb :debate_search, "Поиск", :debate_search_url
  crumb :contact, "Контакты", "asdas"
  crumb :recover_password, "Продседура востановления пароля", :recover_password_url
  crumb :newpassword, "Продседура востановления пароля", :recover_password_url


  # Specify controller, action, and an array of the crumbs you specified above
  trail :debates, :new, [:root, :new_debate]
  trail :debates, :show, [:root, :show_debate]
  trail :debates, :mydebates, [:root, :mydebates]
  trail :debates, :index, [:root, :index_debates]
  trail :home, :index, [:root]
  trail :comments, :new, [:root, :debates_comments, :new_comment]
  trail :comments, :create, [:root, :debates_comments, :new_comment]
  trail :users, :edit, [:root, :edit_user]
  trail :users, :new, [:root, :new_user]
  trail :users, :create, [:root, :new_user]
  trail :user_sessions, :new, [:root, :login]
  trail :debates, :search, [:root, :debate_search]
  trail :contents, :show, [:root, :contact]
  trail :contacts, :index, [:root, :contact]
  trail :user_sessions, :recover_password, [:root, :recover_password]
  trail :users, :newpassword, [:root, :newpassword]


  # Specify the delimiter for the crumbs
  delimit_with " > "
end

