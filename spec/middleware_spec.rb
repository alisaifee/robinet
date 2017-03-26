describe Robinet::Middleware do
  describe '#call' do
    let(:app) { proc { [200, {}, ['Hello, world.']] } }
    let(:stack) { Robinet::Middleware.new(app) }
    let(:request) { Rack::MockRequest.new(stack) }
    let(:response) { request.get('/') }
    context 'with default settings' do
      it 'does not check rate limits' do
        expect(stack).not_to receive(:check_limits)
        expect(response.status).to eq(200)
      end
    end
    context 'with rate limiter enabled' do
      before { Robinet.config.enabled = true }
      it 'checks rate limits' do
        expect(stack).to receive(:check_limits).and_raise(Robinet::Errors::RateLimitExceeded)
        expect(response.status).to eq(429)
      end
    end
  end
end
