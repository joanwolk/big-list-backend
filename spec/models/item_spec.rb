# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  subject(:shit) { build(:item) }
  subject(:shit2) { build(:item) }
  it 'successfully creates an item' do
    expect(shit.save).to be_truthy
  end

  describe '.filter_by_params' do
    before do
      shit.save
      shit2.save
    end

    it 'filters by year' do
      shit2.update(year: 1999)
      expect(Item.filter_by_params({ year: 1999 }).count).to be(1)
    end

    it 'filters by item text' do
      shit2.update(original_item: 'Running spit')
      expect(Item.filter_by_params({ item_text: 'shit' }).count).to be(1)
    end

    it 'filters by points' do
      shit2.update(point_value: 1)
      expect(Item.filter_by_params({ points: 1 }).count).to be(1)
    end

    it 'filters by item_number' do
      shit2.update(item_number: 1)
      expect(Item.filter_by_params({ item_number: 1 }).count).to be(1)
    end

    context 'With NSFP Item' do
      before do
        shit2.update(rating: 'NSFP')
      end
      it 'ignores NSFP items' do
        expect(Item.filter_by_params({}).count).to be(1)
      end

      it 'shares NSFP items when asked explicitly' do
        expect(Item.filter_by_params({ rating: 'Nsfp' }).count).to be(2)
      end
    end
  end
end
