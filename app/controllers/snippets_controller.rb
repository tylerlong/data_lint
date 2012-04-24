require 'json'

class SnippetsController < ApplicationController

  def create
    @snippet = Snippet.new(params[:snippet])

    return render 'static_pages/home' unless @snippet.valid?

    begin
      @result = YAML.load(@snippet.content)
    rescue => ex
      flash.now[:error] = ex.message
    else
      @result = JSON.pretty_generate(@result)
      flash.now[:success] = 'the YAML data is valid.'
    end
    render 'static_pages/home'
  end

end