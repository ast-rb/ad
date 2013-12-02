class MessageForUser < ActionMailer::Base
  def send_status(ad)
    @ad = ad
    mail(
        to: @ad.user.email,
        subject: t('mail.subject'),
        from: 'manager@ads.com'
    )

  end
end
