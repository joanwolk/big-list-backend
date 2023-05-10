# frozen_string_literal: true

FactoryBot.define do
  factory :item do
    year { 2009 }
    item_number { 156 }
    original_item { 'Take a running shit. [20 points]' }
    spellchecked_item { 'Take a running shit. [20 points]' }
    points { '20 points' }
    point_value { 20 }
    rating { 'Caution' }
    errata { 'This was bad' }
    context { 'Why would they do this' }
  end
end
