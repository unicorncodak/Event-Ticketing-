class Event < ApplicationRecord
    belongs_to :User, optional: true
    belongs_to :Category, optional: true

    validates :name, presence: true
    validates :description, presence: true
    validates :location, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true

    def self.get_category(category_id)
        category = Category.where(id: category_id).pluck(:title)[0]
    end
end
