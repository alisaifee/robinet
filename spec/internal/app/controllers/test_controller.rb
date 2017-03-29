class TestController < ActionController::Base
  def index
    render json: {foo: :bar}
  end
end