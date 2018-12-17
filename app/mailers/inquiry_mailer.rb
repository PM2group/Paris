class InquiryMailer < ApplicationMailer

    def send_mail(inquiry)
        @inquiry = inquiry
        if (@inquiry.id / 1000000000) == 1
        mail(
          from: 'send.mail.0420@gmail.com',
          to:   inquiry.mem_info,      
          subject: 'アカウント登録について'
        )
        else
        mail(
        from: 'send.mail.0420@gmail.com',
        to:   inquiry.com_info,      
        subject: 'アカウント登録について'
        )
        end
    end
      

end
