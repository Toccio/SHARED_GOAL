class Skill < ApplicationRecord
  belongs_to :user_id
  belongs_to :list_id
end
