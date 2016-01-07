class TagsController < ApplicationController
  before_action :set_tag, only: [:show]

  # GET /tags
  # GET /tags.json
  def index
    @tags = if params.include?(:prefix)
      ActsAsTaggableOn::Tag.where('name LIKE :prefix', prefix: "#{params[:prefix]}%").order(:name)
    else
      ActsAsTaggableOn::Tag.order(:name).all
    end
  end

  # GET /tags/name
  # GET /tags/name.json
  def show
    @images = Image.tagged_with @tag
  end

  private

  def set_tag
    @tag = ActsAsTaggableOn::Tag.find_by!(name: params[:name])
  end
end
