class Article < ActiveRecord::Base
  extend FriendlyId

  # default scope

  # constant

  # attr macros
  enum status: %i(draft publish deleted)

  # association macros
  belongs_to :author, class_name: 'User'
  has_many :tags

  # validation macros
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }

  # callback macros
  before_create :set_default_status
  before_validation :set_default_slug, on: :create
  before_validation :parameterize_slug

  # other macros
  friendly_id :slug, use: :slugged

  # scope macros

  def publish
    update(status: :publish)
  end

  def unpublish
    update(status: :draft)
  end

  def to_param
    slug
  end

  private

  def set_default_status
    self.status ||= :draft
  end

  def set_default_slug
    self.slug ||= title.try(:parameterize)
  end

  def parameterize_slug
    self.slug = self.slug.try(:parameterize)
  end
end
