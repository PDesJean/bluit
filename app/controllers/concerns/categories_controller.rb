class CategoriesController < ApplicationController
  before_action :find_category, only: [:show]

  def show
    @posts = @category.posts.paginate(page: params[:page])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      redirect_to posts_path, notice: "Thanks for your category!"
    else
      flash.now[:alert] = @category.errors.full_messages
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def find_category
    @category = Category.find params[:id]
  end
end
