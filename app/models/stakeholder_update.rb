class StakeholderUpdate < ApplicationRecord
  include Hashable

  belongs_to :project

  has_rich_text :content

  before_create :generate_uuid

  def generate_uuid
    self.uuid = generate_hash(24)
  end

  def confirmed?
    confirmed_at?
  end

  def user
    project.user
  end
end
