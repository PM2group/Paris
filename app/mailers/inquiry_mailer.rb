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

    def offer_mail(inquiry)
        @inquiry = inquiry

        mail(
          from: 'send.mail.0420@gmail.com',
          to:   inquiry.mem_info,      
          subject: 'オファー希望が来ました'
        )

    end

    def approval_mail(inquiry)
        @inquiry = inquiry

        mail(
            from: 'send.mail.0420@gmail.com',
            to:   inquiry.com_info,      
            subject: "オファー承認されました"
            )

    end
      

end
