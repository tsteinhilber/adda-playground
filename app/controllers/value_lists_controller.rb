class ValueListsController < ApplicationController
  before_action :set_value_list, only: [:show, :edit, :update, :destroy]

  # GET /value_lists
  # GET /value_lists.json
  def index
    @value_lists = ValueList.all
  end

  # GET /value_lists/1
  # GET /value_lists/1.json
  def show
    @value_items = @value_list.value_items.order(:position)
    @new_item = @value_list.value_items.build
  end

  # GET /value_lists/new
  def new
    @value_list = ValueList.new
  end

  # GET /value_lists/1/edit
  def edit
  end

  # POST /value_lists
  # POST /value_lists.json
  def create
    @value_list = ValueList.new(value_list_params)

    respond_to do |format|
      if @value_list.save
        format.html { redirect_to @value_list, notice: 'Value list was successfully created.' }
        format.json { render :show, status: :created, location: @value_list }
      else
        format.html { render :new }
        format.json { render json: @value_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /value_lists/1
  # PATCH/PUT /value_lists/1.json
  def update
    respond_to do |format|
      if @value_list.update(value_list_params)
        format.html { redirect_to @value_list, notice: 'Value list was successfully updated.' }
        format.json { render :show, status: :ok, location: @value_list }
      else
        format.html { render :edit }
        format.json { render json: @value_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /value_lists/1
  # DELETE /value_lists/1.json
  def destroy
    @value_list.destroy
    respond_to do |format|
      format.html { redirect_to value_lists_url, notice: 'Value list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_value_list
      @value_list = ValueList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def value_list_params
      params.require(:value_list).permit(:name, :value_items)
    end
end
