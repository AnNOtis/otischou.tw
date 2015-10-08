class Article < ActiveRecord::Base
  # default scope

  # constant

  # attr macros
  enum status: %i(draft publish deleted)

  # association macros
  belongs_to :author, class_name: 'User'
  has_many :tags

  # validation macros

  # callback macros

  # other macros

  # scope macros
end
