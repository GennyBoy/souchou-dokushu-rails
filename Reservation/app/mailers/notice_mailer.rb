class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.greeting.subject
  #
  def greeting(event)
    @message = "#{event.name}さん、申し込みありがとうございます。}"
    @url = "http://example.com"
    delivery_options = { user_name: "guest",
                          password: "guest" }
    mail to: event.email,
      cc: "event_host@example.com",
      subject: "地元の食材フェスティバルのご招待",
      delivery_method_options: delivery_options
  end
end
