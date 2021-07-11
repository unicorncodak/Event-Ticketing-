class Event < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :location, presence: true
    validates :category, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :start_time, presence: true
    validates :end_time, presence: true
    validates :paid, presence: true
end
