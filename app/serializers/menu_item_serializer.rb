class MenuItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :tags

  def tags
    object.tag_list
  end
end
