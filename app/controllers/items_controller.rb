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
    search_conditions[:keyword] = @search_params[:keyword].presence || "スマホ" # デフォルトキーワードを設定
  
    # 楽天モバイルで購入できる商品に絞り込み
    if @search_params[:rakuten] == "1"
      search_conditions[:carrier] = 1 # 楽天モバイルのキャリアコードを指定
    end
  
    if search_conditions.present?
      @items = RakutenWebService::Ichiba::Item.search(search_conditions)
    end
  end

  private

  def item_search_params
    params.permit(:condition, :rakuten, :keyword)
  end
end
