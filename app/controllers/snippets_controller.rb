#coding=utf-8

require 'json'

class SnippetsController < ApplicationController

  def index
    @snippet = @snippet1 = @snippet2 = Snippet.new
  end

  def validate
    @snippet, @snippet1, @snippet2 = Snippet.new, Snippet.new, Snippet.new
    @snippet.format = params[:data_format]
    @snippet.content = params[:data_content]
    @snippet1.format = 'yaml'
    @snippet2.format = 'json'

    if @snippet.format == 'yaml'
      @snippet1 = @snippet
      begin
        result = YAML.load(@snippet.content)
      rescue => ex
        flash.now[:error] = ex.message
        return render 'index'
      end
      @snippet2.content = JSON.pretty_generate(result)
      flash.now[:success] = 'the YAML data is valid.'
    else
      @snippet2 = @snippet
      begin
        result = JSON.load(@snippet.content)
      rescue => ex
        flash.now[:error] = ex.message
        return render 'index'
      end
      @snippet1.content = YAML.dump(result)
      flash.now[:success] = 'the JSON data is valid.'
    end

    render 'index'
  end

end