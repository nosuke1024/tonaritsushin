class LineConnectionsController < ApplicationController
  before_action :require_login

  def callback
    auth = request.env["omniauth.auth"]

    if current_user.update(line_user_id: auth.uid)
      redirect_to my_profile_path, success: t("defaults.flash_message.line_success")
    else
      redirect_to my_profile_path, danger: t("defaults.flash_message.line_failure")
    end
  end
end
