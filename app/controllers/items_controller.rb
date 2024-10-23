class ItemsController < ApplicationController
  def index
    @items = RakutenWebService::Ichiba::Item.search(keyword: 'スマートフォン本体')
  end

  def search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
    end
  end
end
