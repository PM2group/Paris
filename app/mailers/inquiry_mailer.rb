class InquiryMailer < ApplicationMailer

    def send_mail(inquiry)
        @inquiry = inquiry
        mail(
          from: 'send.mail.0420@gmail.com',
          to:   inquiry.mem_info,
          
          subject: 'アカウント登録について'
        )
    end
      

end
