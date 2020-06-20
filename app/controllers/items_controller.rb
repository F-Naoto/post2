class ItemsController < ApplicationController

  # item一覧
  def index
    @items = Item.all
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  # item新規作成
  def new
    @item = Item.new
  end

  # item作成
  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:success] = '投稿に成功しました。'
      redirect_to items_path
    else
      flash.now[:danger]= '投稿に失敗しました。'
      render :new
    end
  end

  # item削除
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end


  private

  def item_params
    params.require(:item).permit(:genre, :target, :explanation, :user_id, images: [])
  end
end
