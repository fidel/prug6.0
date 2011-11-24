class SnippetsController < ApplicationController

  def show
    @snippet = Snippet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @snippet }
    end
  end

  def new
    @snippet = Snippet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @snippet }
    end
  end

  def create
    @snippet = Snippet.new(params[:snippet])
    if @snippet.save
      uri = URI.parse('http://pygments.appspot.com/')
      request = ::Net::HTTP.post_form(uri, {'lang' => @snippet.language, 'code' => @snippet.plain_code})
      @snippet.update_attribute(:highlighted_code, request.body)
      redirect_to @snippet, :notice => "Successfully created snippet."
    else
      render 'new'
    end
  end
end
