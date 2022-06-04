class Entity < ApplicationRecord
  belongs_to :group, class_name: 'Group'
  belongs_to :user, class_name: 'User'
  validates :name, presence: true
  validates :amount, presence: true
  validates :group, presence: true
  validates :user, presence: true

  def self.total_amount(entity)
    sum = 0
    entity.each do |e|
      sum += e.amount
    end
    sum
  end
end
