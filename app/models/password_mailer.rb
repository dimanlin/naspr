class PasswordMailer < ActionMailer::Base

  def new_password(user, password)
    recipients user.login
    from "devandart@ya.ru"
    subject "Смена пароля на naspr.ru"
    body :password => password
  end

end

