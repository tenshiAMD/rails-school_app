class TranslationsController < ApplicationController
  respond_to :json

  # Don't redirects even a user is not authenticated
  skip_before_action :authenticate_user!

  def show
    @locale = params[:locale].to_s.to_sym || I18n.config.locale
    @part = params[:part].to_s.to_sym || :default

    @translations = I18n.with_locale(@locale) do
      I18n.backend.send(:translations)[@locale][:translations][@part]
    end

    respond_with(@translations) do |format|
      format.json { render json: @translations, adapter: false }
    end
  end
end
