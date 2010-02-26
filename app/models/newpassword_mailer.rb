class NewpasswordMailer < ActionMailer::Base

  def send_new_password(user, password)
    recipients user.login
    from "devandart@ya.ru"
    subject "Востановление пароля на naspr.ru"
    body :password => password
  end

end

