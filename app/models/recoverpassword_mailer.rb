class RecoverpasswordMailer < ActionMailer::Base

  def recover_password(user, securestring)
    recipients user.login
    from "devandart@ya.ru"
    subject "Новый пароль на naspr.ru"
    body :securestring => securestring
  end

end

