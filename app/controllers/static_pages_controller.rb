class StaticPagesController < ApplicationController

  def home
    @snippet = @snippet1 = @snippet2 = Snippet.new
  end

end