class CategoriesController < ApplicationController

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
end
