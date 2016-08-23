module APIJsonResponseSupport
  extend ActiveSupport::Concern

  included do
    before do
      request.headers['Accept'] = Mime::JSON
      request.headers['Content-Type'] = Mime::JSON.to_s
    end
  end
end

RSpec.configure do |config|
  config.include APIJsonResponseSupport, type: :controller
end
