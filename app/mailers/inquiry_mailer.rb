class InquiryMailer < ApplicationMailer

    def send_mail(inquiry)
        @inquiry = inquiry
        mail(
          from: 'send.mail.0420@gmail.com',
          to:   'send.mail.0420@gmail.com',
          #to:   'manager@example.com',
          subject: 'お問い合わせ通知'
        )
    end

end
