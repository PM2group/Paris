class InquiryMailer < ApplicationMailer

    def send_mail(inquiry)
        @inquiry = inquiry
        mail(
          from: 'send.mail.0420@gmail.com',
          to:   'send.mail.0420@gmail.com',
          
          subject: 'アカウント登録について'
        )
    end
      

end
