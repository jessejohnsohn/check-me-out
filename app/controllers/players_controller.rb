class PlayersController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def hello
    render text: "&iexclHola, mundo!"
  end

  def goodbye
    @player = Player.all
  end

  def find_it
    @post = Client.where(:name => params[:find_it])
  end

end
