class MatcherApi
  def call(params:)
    uri = URI.parse(ENV.fetch("CUTIRO_API_URL"))
    http = Net::HTTP.new(uri.host)
#    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.path, {"Content-Type" => "application/json"})
    request.body = params.to_json

    http.request(request)
  end
end
