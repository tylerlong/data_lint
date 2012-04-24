require 'pp'

class SnippetsController < ApplicationController

  def create
    @snippet = Snippet.new(params[:snippet])
    begin
      @result = YAML.load(@snippet.content)
    rescue => ex
      flash.now[:error] = ex.message
    else
      @result = PP.pp(@result, "")
      flash.now[:success] = 'the YAML data is valid.'
    end
    render 'static_pages/home'
  end

end