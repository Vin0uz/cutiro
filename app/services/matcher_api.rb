require "httparty"

class MatcherApi
  def call(params:)
    url = ENV.fetch("CUTIRO_API_URL")

    HTTParty.post(url,
      body: params.to_json,
      headers: { 'Content-Type': 'application/json' },
    )
  end
end
