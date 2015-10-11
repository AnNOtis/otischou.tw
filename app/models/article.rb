class Article < ActiveRecord::Base
  # default scope

  # constant

  # attr macros
  enum status: %i(draft publish deleted)

  # association macros
  belongs_to :author, class_name: 'User'
  has_many :tags

  # validation macros
  validates :title, presence: true

  # callback macros
  before_create :set_default_status

  # other macros

  # scope macros

  def publish
    update(status: :publish)
  end

  def unpublish
    update(status: :draft)
  end

  private

  def set_default_status
    self.status ||= :draft
  end
end
