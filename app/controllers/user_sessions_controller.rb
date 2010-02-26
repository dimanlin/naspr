class UserSessionsController < ApplicationController

  before_filter :contents

  layout "main"

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Вы успешно авторизировались"
      redirect_back_or_default(root_url)
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to root_url
  end

  def recover_password
    if request.post?
      if params[:email].size > 0
        @user = User.find_by_login(params[:email])
        if @user
          securerandom = SecureRandom.hex(20)
          recoverpassword = Recoverpassword.find_by_id(@user.id)
          if recoverpassword
            recoverpassword.update_attribute(:key, securerandom)
          else
            Recoverpassword.create!(:user_id => @user.id, :key => securerandom)
          end

          RecoverpasswordMailer.deliver_recover_password(@user, securerandom)
          flash.now[:notice] = "Информация о смене пароля была высланна вам на почту"
        else
          flash[:notice] = "Пользователь с такой электронной почной не существует"
        end
      else
        flash[:notice] = "Вы должны указать свою электронную почту"
      end
    end
  end

end

