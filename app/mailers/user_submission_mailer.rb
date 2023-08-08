class UserSubmissionMailer < ApplicationMailer
    def accept(user_submission)
        @name = user_submission.name
        mail(to: user_submission.email, subject: "Congrats, you were accepted!")
    end
    
    def reject(user_submission)
        mail(to: user_submission.email, subject: "Sorry, you were rejected.")
    end
end