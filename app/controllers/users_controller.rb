class UsersController < ApplicationController

  layout "main"

  before_filter :contents

  def new
    @debate = Debate.last
    @comment = Comment.new(:debate_id => @debate.id)
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_back_or_default root_url
    else
      @debate = Debate.last
      @comment = Comment.new(:debate_id => @debate.id)
      render :action => "new"
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    if @user.save
      redirect_to root_url
    else
      render :action => "edit"
    end
  end

  def newpassword
    recoverpassword = Recoverpassword.find_by_key(params[:key])
      if recoverpassword
        @user = recoverpassword.user
        @user.update_attribute(:key, params[:key])
      else
        @disableinput = true
        flash[:notice] = "Произошла ошибка востановления пароля, не верный адрес востановления пароля"
      end
  end

    def createnewpassword
      unless params[:user][:password].empty?
        recoverpassword = Recoverpassword.find_by_key(params[:user][:key])
        if recoverpassword
          if recoverpassword.created_at < Time.now && Time.now < (recoverpassword.created_at + 18.hour)
            @user = recoverpassword.user
            @user.update_attributes(params[:user])
            if @user.save
              NewpasswordMailer.deliver_send_new_password(@user, params[:user][:password])
              recoverpassword.destroy
              flash[:notice] = "Новый пароль был выслан вам на почту"
              redirect_to root_url
            else
              render :action => "newpassword"
            end

          else
            flash[:notice] = "Время действия ссылки для востановление пароля истекло, повторите операцию востановления пароля"
            render :action => "newpassword"
          end
        else
          render :action => "newpassword"
        end
      else
        flash[:notice] = "Введите новый пароль"
        redirect_to :back
      end

  end

end

