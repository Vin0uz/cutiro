class MatcherApi
  def call(email:, payrolls_url:, teachers_url:)
    uri = URI.parse(ENV.fetch("CUTIRO_API_URL"))
    http = Net::HTTP.new(uri.host)
#    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.path, {"Content-Type" => "application/json"})
    request.body = {
      email: email,
      payrolls: payrolls_url,
      teachers: teachers_url,
    }.to_json

    http.request(request)
  end
end
