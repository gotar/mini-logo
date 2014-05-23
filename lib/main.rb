class WrongInput < StandardError; end

class Main
  def command(x)
    raise SystemExit if x.match(/q/i)
    raise WrongInput unless x.match(/[uldr]/i)
  end
end
