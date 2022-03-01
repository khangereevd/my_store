require 'rails_helper'

describe Item do

  it 'validates the name and makes sure it s not empty' do
    item = Item.new(name: '')
    item.valid?
    expect(item.errors[:name]).not_to be_empty
  end

end