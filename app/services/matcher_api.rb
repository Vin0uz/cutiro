class MatcherApi
  def call(params:)
    uri = URI.parse(ENV.fetch("CUTIRO_API_URL"))
    http = Net::HTTP.new(uri.host)

    request = Net::HTTP::Post.new(uri.path)
    request.body = params.to_json
    request['Content-Type'] = 'application/json'


    http.request(request)
  end
end
