class Item < ApplicationRecord
  has_many :positions
  has_many :carts, through: :positions
  has_many :comments, as: :commentable
  has_one :image, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :image, allow_destroy: true, reject_if: :all_blank

  validates :price, numericality: { greater_than: 0, allow_nil: true }
  validates :name, :description, presence: true

  # after_save :save_image
  #
  # private
  #
  # def save_image
  #   dbbfg
  # end

  # def image=(i)
  #   if !image || !new_record?
  #     @image = Image.create(i.merge({ imageable: self }))
  #   end
  # end

  # belongs_to :category
  #
  # after_initialize {  } # Item.new
  # after_save       {  } # Item.save; Item.create; item.update()
  # after_create     { category.inc(:items_count, 1) } #Item.create
  # after_update     {  } # item.update
  # after_destroy    { category.inc(:items_count, -1) } # item.destroy

  # before_save       {  } # Item.save; Item.create; item.update()
  # before_create     { category.inc(:items_count, 1) } #Item.create
  # before_update     {  } # item.update
  # before_destroy    { category.inc(:items_count, -1) } # item.destroy
end
