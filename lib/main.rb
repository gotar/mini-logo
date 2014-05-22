class WrongInput < StandardError; end

class Main
  def command(x)
    raise WrongInput unless x.match(/[uldr]/)
  end
end
