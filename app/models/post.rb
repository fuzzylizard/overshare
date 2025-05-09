class Post < ApplicationRecord
  validates :message, length: { in: 1..420 }
end
