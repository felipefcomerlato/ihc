class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :get_categories, only: [:new, :edit, :menu]
  # load_resource
  # GET /items
  # GET /items.json
  def index
    @items = Item.all.order(category_id: :asc)
  end

  # Diferente de Index pois aqui é para visão do usuário e não gerenciamento interno de items
  def menu
    @bill = params[:bill_id]
    @items = Item.all
    @orders = Order.where(bill_id: @bill)
    @ingredients = Ingredient.all
    @ingredients.each do |ing|
      ing.contained = 1
      ing.save
    end
  end

  def edit_order_items
    @bill = params[:bill_id]
    @ingredients = Ingredient.all.where(item_id: params[:item_id])
    @item = Item.find(params[:item_id])
  end

  def order_item
    redirect_back(fallback_location: root_path)
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def get_categories
      @categories = Category.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :description, :value, :category_id, :photo)
    end
end
