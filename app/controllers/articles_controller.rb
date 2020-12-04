class ArticlesController < ApplicationController
  # Provides basic security by requiring a username/password on everything except index and show
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  # Allows the controller to show all the articles in the database
  def index
    @articles = Article.all # Note the plural on articles
  end

  # Allows the controller to read the form data from the database - requires a new webpage
  def show
    @article = Article.find(params[:id])
  end

  # Creates the articles/new page which takes the new.html.erb layout
  def new
    @article = Article.new
  end

  # Edits the articles/database
  def edit
    @article = Article.find(params[:id])
  end

  # Takes POST data from the form on articles/new and saves it to a database resource
  def create
    # For safety and repeat calling, the input data pulls the function below
    @article = Article.new(article_params)

    # To account for validation which may cause the save to fail, need to redirect the user to try again
    if @article.save
    # This part redirects to the newly saved article to display it, using the show function above
      redirect_to @article
    else
      render 'new'
    end
  end

  # Allows existing information to be updated, required for the edit action above
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # Delete function for the database
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  # Private functions can only be called within a script?
  private

  # Takes the params file from the /new page and permits only title and text for security
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
