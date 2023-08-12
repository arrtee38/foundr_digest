class UserSubmissionMailer < ApplicationMailer
    def accept(user_submission, password)
        @name = user_submission.name
        @email = user_submission.email
        @password = password
        mail(to: user_submission.email, subject: "Congrats, you were accepted!")
    end
    
    def reject(user_submission)
        mail(to: user_submission.email, subject: "Sorry, you were rejected.")
    end
end