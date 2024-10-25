# rubocop:disable Layout/SpaceInsideArrayLiteralBrackets
class WelcomeController < ApplicationController
  layout "welcome_layout", only: [:index]

  def index
  end
end

# rubocop:enable Layout/SpaceInsideArrayLiteralBrackets
