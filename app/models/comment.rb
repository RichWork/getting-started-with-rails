class Comment < ApplicationRecord
  # this sets up an Active Record association
  belongs_to :article
end
