QB_KEY = ENV['QUICKBOOKS_KEY']
QB_SECRET = ENV['QUICKBOOKS_SECRET']
QB_COMPANY_ID = ENV['QUICKBOOKS_COMPANY_ID']

$qb_oauth_consumer = OAuth::Consumer.new(QB_KEY, QB_SECRET, {
    :site                 => "https://oauth.intuit.com",
    :request_token_path   => "/oauth/v1/get_request_token",
    :authorize_url        => "https://appcenter.intuit.com/Connect/Begin",
    :access_token_path    => "/oauth/v1/get_access_token"
})

Quickbooks::Base.configure do |c|
  c.persistent_token = QB_KEY
  c.persistent_secret = QB_SECRET
  c.persistent_company_id = QB_COMPANY_ID
end