module UserSubmitted
  class PagesController < ApplicationController

    def home
      @collections = UserSubmitted::Collection.includes(:contents).all

    end
  end
end
