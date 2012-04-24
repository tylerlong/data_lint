class StaticPagesController < ApplicationController

  def home
    @snippet = Snippet.new
  end

end