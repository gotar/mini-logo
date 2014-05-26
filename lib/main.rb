class WrongInput < StandardError; end

class Main

  def command(x)
    raise SystemExit if x =~ /q/i
    raise WrongInput unless x =~ /[uldr]/i && x !~ /\-\d+/
  end
end
