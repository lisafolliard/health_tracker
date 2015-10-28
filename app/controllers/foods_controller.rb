class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  # GET /foods
  def index
    @foods = Food.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 3, :page => params[:page])
  end

  # GET /foods/1
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to @food, notice: 'Food was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /foods/1
  def update
    if @food.update(food_params)
      redirect_to @food, notice: 'Food was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /foods/1
  def destroy
    @food.destroy
    redirect_to foods_url, notice: 'Food was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def sort_column
      Food.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

    def set_food
      @food = Food.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def food_params
      params.require(:food).permit(:name, :calories)
    end
end
