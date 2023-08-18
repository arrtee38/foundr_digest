class UserSubmissionMailer < ApplicationMailer
  def accept(user_submission, created_user)
    @name = user_submission.name
    @email = user_submission.email
    @auth_code = created_user.auth_code

    mail(to: user_submission.email, subject: 'Congrats, you were accepted!')
  end

  def reject(user_submission)
    mail(to: user_submission.email, subject: 'Sorry, you were rejected.')
  end
end
