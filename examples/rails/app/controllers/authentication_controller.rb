class AuthenticationController < ApplicationController
  # We must disable CSRF check when Steam issues the callback request.
  skip_before_action :verify_authenticity_token, only: [:callback]

  def callback
    render :text => request.env["omniauth.auth"].info.to_hash.inspect
  end
end
