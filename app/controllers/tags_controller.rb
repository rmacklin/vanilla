class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  # GET /tags
  # GET /tags.json
  def index
    @tags = ActsAsTaggableOn::Tag.order(:name).all
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @images = Image.tagged_with @tag
  end

  private

  def set_tag
    @tag = ActsAsTaggableOn::Tag.find_by!(name: params[:name])
  end
end
