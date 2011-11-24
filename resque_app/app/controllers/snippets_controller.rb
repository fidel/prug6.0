class SnippetsController < ApplicationController

  def show
    @snippet = Snippet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @snippet = Snippet.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @snippet = Snippet.new(params[:snippet])
    if @snippet.save
      Resque.enqueue(::SnippetHighlighter, @snippet.id)
      redirect_to @snippet, :notice => "Successfully created snippet."
    else
      render 'new'
    end
  end

end
