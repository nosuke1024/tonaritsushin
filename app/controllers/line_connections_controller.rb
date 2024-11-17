class LineConnectionsController < ApplicationController
  before_action :authenticate_user!

  def callback
    auth = request.env['omniauth.auth']

    if current_user.update(line_user_id: auth.uid)
      flash[:notice] = 'LINEアカウントと連携しました'
    else
      flash[:alert] = '連携に失敗しました'
    end

    redirect_to my_profile_path
  end

  def destroy
    if current_user.update(line_user_id: nil)
      flash[:notice] = 'LINE連携を解除しました'
    else
      flash[:alert] = '連携解除に失敗しました'
    end

    redirect_to my_profile_path
  end
end