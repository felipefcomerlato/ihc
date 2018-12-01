class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  def add_order
    @item = Item.find(params[:item_id])
    @ingredients = Ingredient.all.where(contained: 0, item_id: params[:item_id])
    obs = ""
    if [1,2,3,4,6].include?(@item.category_id)
      @ingredients.each do |ing|
        if obs == ""
          obs << "Sem #{ing.name}"
        else
          obs << ", sem #{ing.name}"
        end
      end
    end
    if @item.category_id == 5
      obs = ""
    elsif obs == ""
      if @item.category_id == 4
        obs << "Com gelo e limão!"
      else
        obs << "Completo!"
      end
    else
      obs << "."
    end
    @order = Order.new(
      :value => params[:value],
      :description => params[:description],
      :obs => obs,
      :qtd => 1,
      :bill_id => params[:bill_id],
      :name => params[:name],
      :status => 0
    )
    if @order.save
      redirect_to menu_path(:bill_id => params[:bill_id])
    end
  end

  def back_to_menu
    redirect_to menu_path(:bill_id => params[:bill_id])
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_back(fallback_location: root_path)
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:value, :description, :obs, :qtd, :bill_id, :status, :name)
    end
end
