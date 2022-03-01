class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy, :upvote]
  before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]
  before_action :init_item, only: [:new, :create]
  before_action :init_image, only: [:edit, :update, :new, :create]

  def index
    @items = Item
    @items = @items.where('price >= ?', params[:price_from]) if params[:price_from]
    @items = @items.where('created_at >= ?', 1.day.ago) if params[:today]
    @items = @items.where('votes_count >= ?', params[:votes_from]) if params[:votes_from]
    @items = @items.order('votes_count DESC', 'price')
    @items = @items.includes(:image)
  end

  def expensive
    @items = Item.where('price > 1000')
    render 'index'
  end

  # /items/1 GET
  def show
    # raise 'exception test!'
    unless @item
      render_404
    end
  end

  # /items/new GET
  def new
  end

  # /items/1/edit GET
  def edit
  end

  # /items POST
  def create
    @item.assign_attributes(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  # /items/1 PUT
  def update
    @item.update(item_params)
    if @item.errors.empty?
      flash[:success] = 'Item successfully update!'
      redirect_to item_path(@item)
    else
      flash.now[:error] = 'You made mistakes in your form! Please correct them.'
      render 'edit'
    end
  end

  # /items/1 DELETE
  def destroy
    @item.destroy
    render json: { success: true }
  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to items_path
  end

  private

  def init_item
    @item = Item.new
  end

  def init_image
    @item.build_image unless @item.image
  end

  def item_params
    params
      .require(:item)
      .permit(:name, :price, :description, :weight,
              image_attributes: %i[id file remove_file])
  end

  def find_item
    @item = Item.find_by(id: params[:id])
  end

end
