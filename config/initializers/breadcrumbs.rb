Breadcrumb.configure do
  dont_link_last_crumb
  # Specify name, link title and the URL to link to
  crumb :root, "Главная", :root_url
  crumb :new_debate, "Новый спор", :new_debate_url
  crumb :show_debate, "Спор/мнение", :new_debate_url
  crumb :debates_comments, "Спор/мнение", :debate_url, '@debate'
  crumb :new_comment, "Новый комментарий", :new_comment_url
  crumb :mydebates, "Мои споры/мнения", :mydebates_debates_url
  crumb :edit_user, "Мои настройки", :edit_users, '@users'
  crumb :new_user, "Регистрация", :new_user
  crumb :login, "Авторизация", :login_url
  crumb :debate_search, "Поиск", :debate_search_url
  crumb :contact, "Контакты", "asdas"


  # Specify controller, action, and an array of the crumbs you specified above
  trail :debates, :new, [:root, :new_debate]
  trail :debates, :show, [:root, :show_debate]
  trail :debates, :mydebates, [:root, :mydebates]
  trail :home, :index, [:root]
  trail :comments, :new, [:root, :debates_comments, :new_comment]
  trail :comments, :create, [:root, :debates_comments, :new_comment]
  trail :users, :edit, [:root, :edit_user]
  trail :users, :new, [:root, :new_user]
  trail :users, :create, [:root, :new_user]
  trail :user_sessions, :new, [:root, :login]
  trail :debates, :search, [:root, :debate_search]
  trail :contents, :show, [:root, :contact]


  # Specify the delimiter for the crumbs
  delimit_with " > "
end

