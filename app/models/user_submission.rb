class UserSubmission < ApplicationRecord
  include Hashable

  PLAN_NAMES = %w[free pro]

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
    password = generate_hash(8)
    created_user = User.create!(email:, first_name:, last_name:,
                                password:)
    created_user.projects.create!(website:)
    UserSubmissionMailer.accept(self, created_user).deliver
  end
end
