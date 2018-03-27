class TagsController < ApplicationController

  def index
    @tags = Tag.all
    respond_to do |format|
      format.json { render json: Tag.tokens(params[:q]) }
    end
  end

end
