require "base64"

class Admin::QuickbooksController < Admin::ApplicationController
  def index
    qb_access_token = "eyJlbmMiOiJBMTI4Q0JDLUhTMjU2IiwiYWxnIjoiZGlyIn0..NNcOx5QgHnHBi8BXNBYkzQ.gQ7nr0JWebMvn2MHV6FIWk5KJN3HXTxIhrfDYbgOkj_pCTv8geYffEczf3BIWQdU6w1yv5FXRFj07Xmh3FQ254A0-RCmCi30XAvQNbR4f9DYLwBSR40GumjSipw-UANK6Nwxj1Kfr0C5Q5G7Q-35HVkIQMjE3taoZ6aTMIcsg3XeWMl4GLZqHBC3idXVSbimcYy_8nyQkjCVEg3SdvP__eEgIj_PfvSTwSGH1Ul1FXFu4CBWiEhMwbNvoSeg0zN_5ljH_SYp5I-NJLUgvYLRrXVu4lr2RS2s9mM5wXPq1xFuWC_hkSvJNo-sR7cMcv7SsQQs6Veejh61jRf24w_xZCnfchhCNccu8nAnGXvpTFQY8sDBof4EizNJCOTr9KKJiy0MLJOcvzoxiqOeiK6b9QrqGO2Q5H86XHetP3eyVoDFVE6prnuXBU-l8VDVyexEXu1uZzyeAsof-57PLHjFa3FTlOiOlB4zw5dbWhBkALZuWNOrbJY0mN5fbLJqt-NOWDWvHGRmhu-7GbX4H22BvHOGcPtEzHAoH5qeuy9LNYxnnkJvEUAc5h1Z4M8hDu-y4U1Hs3sUpUYPnJGtgBjSF_gloEIL5UrJvl_KUSzxx0TUpEpI5EaWhrXmhiA_fv03VxwPo1ZwrKqwtaCbZvH7nDuLhRTP7ean567PaMHk40C5zDPHGI11nLegzLTNEDqFtaPw2OCLf7QsjyRmHX-5_oCJutL7gb2Fwcj1oZj0RF8.MiY_gC0tgpsGjfqRgJ7ahg"
    qb_refresh_token = "AB11589492115FofusIbrCyOIWgGvWOIObhBtZLofUFxwsVKei"
    client_id = "ABOfu7gYEhIjCFmyyXgqRpEptBYtW8CTtsojP80DaFR0cFi4Fx"
    client_secret = "qXvHedgE87O6PWlMy2vKhvGGb0jG8K2wk5OJS2Gu"


    response = Faraday.post("https://sandbox.api.intuit.com/oauth2//v3/company/4620816365019076980/companyinfo/4620816365019076980") do |req|
      req.headers['Authorization'] = "Bearer #{qb_access_token}"
      req.headers['Accept'] = 'application/json',
      req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
    end


    # Below is to refresh access token with refresh token
    # response = Faraday.post("https://sandbox.api.intuit.com/oauth2/v1/tokens/bearer?grant_type=refresh_token&refresh_token=#{qb_refresh_token}") do |req|
    #   req.headers['Authorization'] = "Basic #{Base64.strict_encode64(client_id + ":" + client_secret)}"
    #   req.headers['Accept'] = 'application/json',
    #   req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
    # end
    @user_info = response

    # qb_access_token = AccessToken.last
    # qb_refresh_token = RefreshToken.last

    # access_token = OAuth2::AccessToken.new(
    #   oauth2_client, qb_access_token, refresh_token: qb_refresh_token
    # )

  end
end