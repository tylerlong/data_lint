require 'json'

class SnippetsController < ApplicationController

  def create
    @snippet, @snippet1, @snippet2 = Snippet.new(params[:snippet]),
      Snippet.new(format: 'yaml'), Snippet.new(format: 'json')

    if @snippet.format == 'yaml'
      @snippet1 = @snippet
      return render 'static_pages/home' unless @snippet1.valid?
      begin
        result = YAML.load(@snippet.content)
      rescue => ex
        flash.now[:error] = ex.message
        return render 'static_pages/home'
      end
      @snippet2.content = JSON.pretty_generate(result)
      flash.now[:success] = 'the YAML data is valid.'
    else
      @snippet2 = @snippet
      return render 'static_pages/home' unless @snippet2.valid?
      begin
        result = JSON.load(@snippet.content)
      rescue => ex
        flash.now[:error] = ex.message
        return render 'static_pages/home'
      end
      @snippet1.content = YAML.dump(result)
      flash.now[:success] = 'the JSON data is valid.'
    end

    render 'static_pages/home'
  end

end