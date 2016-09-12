class RedmineTelegramConnectionsController < ApplicationController
  unloadable

  skip_before_filter :check_if_login_required, :check_password_change

  def create
    @user = User.find(params[:user_id])
    @user.mail == params[:user_email]

    @telegram_account = Redmine2FA::TelegramAccount.find_by(telegram_id: params[:telegram_id])

    if @user.mail == params[:user_email] and params[:token] == 'token'

      @user.telegram_account = @telegram_account
      @user.save
    end

    notice = @user.telegram_account.present? ? 'Аккаунты успешно связаны' : 'Связать аккаунты не удалось. Напишите нам письмо'

    redirect_to home_path, notice: notice
  end
end