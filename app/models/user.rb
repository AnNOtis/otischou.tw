class User < ActiveRecord::Base
  # default scope

  # constant

  # attr macros
  has_secure_password

  # association macros
  has_many :articles, foreign_key: :author_id

  # validation macros

  # callback macros

  # other macros

  # scope macros
end
