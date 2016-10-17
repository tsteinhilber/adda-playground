class ValueItemsController < ApplicationController
  before_action :set_value_item, only: [:show, :edit, :update, :destroy]

  # GET /value_items
  # GET /value_items.json
  def index
    @value_items = ValueItem.all
  end

  # GET /value_items/1
  # GET /value_items/1.json
  def show
  end

  # GET /value_items/new
  def new
    @value_item = ValueItem.new
  end

  # GET /value_items/1/edit
  def edit
  end

  # POST /value_items
  # POST /value_items.json
  def create
    @value_item = ValueItem.new(value_item_params)
    @value_list = ValueList.find(params[:value_list_id])

    respond_to do |format|
      if @value_item.save
        format.html { redirect_to @value_item.value_list, notice: 'Value item was successfully created.' }
        format.json { render :show, status: :created, location: @value_item }
      else
        format.html { render :new }
        format.json { render json: @value_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /value_items/1
  # PATCH/PUT /value_items/1.json
  def update
    respond_to do |format|
      if @value_item.update(value_item_params)
        format.html { redirect_to @value_item, notice: 'Value item was successfully updated.' }
        format.json { render :show, status: :ok, location: @value_item }
      else
        format.html { render :edit }
        format.json { render json: @value_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /value_items/1
  # DELETE /value_items/1.json
  def destroy
    @value_item.destroy
    respond_to do |format|
      format.html { redirect_to value_items_url, notice: 'Value item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value_item
      @value_item = ValueItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def value_item_params
      params.require(:value_item).permit(:value_list_id, :name, :position)
    end
end
