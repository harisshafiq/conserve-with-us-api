class ProspectsController < ApplicationController

  ALLOWED_PARAMS = [:type, :firstName, :lastName, :email, :phoneNumber, :freeResponse, :landTrustName, :landTrustWebsite].freeze

  def create
    post_res = HTTParty.post('https://us14.api.mailchimp.com/3.0/lists/4738e98f70/members',
                          {
                            headers: {
                              'Authorization' => "api #{ENV['MAIL_CHIMP_KEY']}",
                              'Content-Type' => 'application/json',
                              'Accept' => 'application/json'
                            },
                            body: {
                              "email_address": prospect_params[:email],
                              "status": "subscribed",
                              "merge_fields": {
                                "USERTYPE": prospect_params[:type].to_s,
                                "FNAME": prospect_params[:first_name].to_s,
                                "LNAME": prospect_params[:last_name].to_s,
                                "PHONE": prospect_params[:phone_number].to_s,
                                "WEBSITE": prospect_params[:land_trust_website].to_s,
                                "LTNAME": prospect_params[:land_trust_name].to_s,
                                "FREERESP": prospect_params[:free_response].to_s
                              }
                            }.to_json
                          })

    success_response = 'Thanks for signing up. We\'ll be in touch soon with updates!'

    response_message = post_res.code == 200 ? success_response : curate_bad_response(post_res.body)

    render json: {message: response_message}, status: post_res.code
  end

  private

  def curate_bad_response(body)
    json = JSON.parse(body)
    case json['title']
    when 'Invalid Resource'
      json['detail']
    when 'Member Exists'
      'A user with this email already exists in our mailing list'
    else
      'Something went wrong. Please try again.'
    end
  end

  def prospect_params
    params.permit(ALLOWED_PARAMS).transform_keys(&:underscore)
  end
end