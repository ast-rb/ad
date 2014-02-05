class ApplicationController < ActionController::Base
  before_filter :set_locale

  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, notice: t('notice.access_denied')
  end


  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
    logger.debug "default_url_options is passed options: #{options.inspect}\n"
    {locale: I18n.locale}
  end
end
