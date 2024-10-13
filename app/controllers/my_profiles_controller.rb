class MyProfilesController < ApplicationController
  def edit
    @user = current_user # ログイン中のユーザー情報を取得
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to edit_my_profile_path, notice: 'プロフィールを更新しました'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name) # 更新を許可するパラメータ
  end
end
