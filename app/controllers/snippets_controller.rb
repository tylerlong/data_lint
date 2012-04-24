class SnippetsController < ApplicationController

  def create
    @snippet = Snippet.new(params[:snippet])
    begin
      @result = YAML.load(@snippet.content)
    rescue
      flash.now[:error] = 'the YAML data is invalid.'
      render 'static_pages/home'
      return
    end
    flash.now[:success] = 'the YAML data is valid.'
    render 'static_pages/home'
  end

end