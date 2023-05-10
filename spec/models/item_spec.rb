# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'with a running shit' do
    subject(:shit) { build(:item) }

    it 'successfully creates an item' do
      expect(shit.save).to be_truthy
    end
  end
end
