module ImagesHelper
  def image_tags_select(form, image)
    tags = ActsAsTaggableOn::Tag.order(:name).map { |tag| [tag.name, tag.name] }
    form.select(:tag_list, tags, {}, class: 'js-select2 form-control', multiple: true)
  end
end
