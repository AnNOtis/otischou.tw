class PagesController < ApplicationController
  layout 'pages/cv', only: :cv

  def cv; end
end
