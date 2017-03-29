describe 'Robinet::Railtie' do
  describe '#initialize' do
    it 'defines the railtie' do
      expect(Robinet).to be_const_defined(:Railtie)
    end
    it 'adds the middleware to the stack' do
      expect(Combustion::Application.middleware).to include(Robinet::Middleware)
    end
    it 'makes helper methods available to all controllers' do
      expect(TestController).to respond_to(:rate_limit)
    end
  end
end
