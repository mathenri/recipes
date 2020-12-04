class RecipesController < ApplicationController
  def index
    # extract searched tags
    tags = []
    params.each do |input, value|
      if input.start_with?("tag_")
        tags.append(input.delete_prefix("tag_"))
      end
    end
    if tags.length == 0  
      @recipes = Recipe.all
    else
      tagsWhereClauses = tags.map { |tag| "(tags LIKE '%#{tag}%')"}
      @recipes = Recipe.all.where(tagsWhereClauses.join(' AND '))  
    end
  end

  #def show
  #  @recipe = Recipe.find(params[:id])
  #end

  def new
  end

  def create
    
    # extract tags
    tags = []
    params.each do |input, value|
      if input.start_with?("tag_")
        tags.append(input.delete_prefix("tag_"))
      end
    end

    @recipe = Recipe.new(params.permit(:title, :url))
    @recipe.tags = tags.sort.join(";") # keep array of tags in order for tag search regex to work 
    @recipe.save

    redirect_to recipes_path
  end

  #def update
  #  @recipe = Recipe.find(params[:id])
  #
  #  @recipe.update(recipe_params)
  #  redirect_to @recipe
  #end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
   
    redirect_to recipes_path
  end

  #private
  #  def recipe_params
  #    params.require(:recipe)
  #  end
end
