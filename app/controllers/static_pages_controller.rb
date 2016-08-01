class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:contact]
  def home
  end

  def help
  end

  def contact
  end

  def about
  end
end
