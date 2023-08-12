class UserSubmission < ApplicationRecord
    PLAN_NAMES = ['free', 'pro']

    validates :plan_name, inclusion: { in: PLAN_NAMES }
    validates_presence_of :first_name, :last_name, :email, :website, :job_role, :text

    after_update :finish_processing

    def name
        "#{first_name} #{last_name}"
    end

    def finish_processing
        reject! if status == 'Reject'
        accept! if status == 'Accept'
    end

    def reject!
        UserSubmissionMailer.reject(self).deliver
    end

    def accept!
        password = generate_password
        User.create!(email: self.email, password: password)
        UserSubmissionMailer.accept(self, password).deliver
    end

    def generate_password
        SecureRandom.hex(8) 
    end

end
