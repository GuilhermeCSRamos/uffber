class Comment < ApplicationRecord
  belongs_to :lift
  belongs_to :user
end
