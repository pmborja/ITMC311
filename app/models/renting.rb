class Renting < ApplicationRecord
  belongs_to :user
  has_many :posting
end
