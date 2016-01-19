module Capybara
  class Session
    def cookies
      @cookies ||= ActionDispatch::Cookies::CookieJar.new(key_generator)
    end

    private

    def key_generator
      @key_generator ||= ActiveSupport::LegacyKeyGenerator.new(SecureRandom.hex)
    end
  end
end

RSpec.configure do |config|
  config.before(type: :feature) do
    allow_any_instance_of(ActionDispatch::Request).to receive(:cookie_jar) { page.cookies }
  end
end
