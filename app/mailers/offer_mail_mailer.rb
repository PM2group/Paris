class OfferMailMailer < ApplicationMailer

    def o_mail(o_mail)
        @o_mail = o_mail
        if (@o_mail.id / 1000000000) == 1
        mail(
          from: 'send.mail.0420@gmail.com',
          to:   o_mail.mem_info,      
          subject: 'オファー希望が来ました'
        )
        else
        mail(
        from: 'send.mail.0420@gmail.com',
        to:   o_mail.com_info,      
        subject: 'オファー承認されました'
        )
        end
    end

end
