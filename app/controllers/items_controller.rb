class ItemsController < ApplicationController
  def index
    @items = RakutenWebService::Ichiba::Item.search(keyword: 'スマートフォン本体')
  end

  def search
    @search_params = item_search_params
    search_conditions = {}

    # キーワードに商品状態を追加
    keyword = @search_params[:keyword].to_s
    keyword += " " + @search_params[:condition].to_s if @search_params[:condition].present?
    # carrier が "楽天モバイル" の場合のみキーワードに追加
    keyword += " " + @search_params[:carrier].to_s if @search_params[:carrier] == "楽天モバイル" 

    search_conditions[:keyword] = keyword.presence || "スマホ" # デフォルトキーワードを設定

    if search_conditions.present?
      @items = RakutenWebService::Ichiba::Item.search(search_conditions)
    end
  end

  private

  def item_search_params
    params.permit(:keyword, :carrier, :condition)
  end
end
