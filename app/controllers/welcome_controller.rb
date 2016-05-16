class WelcomeController < ApplicationController
  def index
    @rubygems = Rubygem.all
  end
end
