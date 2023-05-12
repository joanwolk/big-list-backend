class ItemSerializer < ActiveModel::Serializer
  attributes :id, :year, :item_number, :item_number_addendum, :original_item, :spellchecked_item, :special_event, :points, :point_value, :rating, :comment, :errata
end
