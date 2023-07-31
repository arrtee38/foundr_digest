class UserSubmissionsController < ApplicationController
    def create
        puts "WHITELISTED PARAMS: #{user_submission_params}"
        # UserSubmission.create(params)
        # accept the client request (form data) and create a new User Submission entry
    end

    def user_submission_params
        params.require(:user_submission).permit(:first_name, :last_name, :email, :website, :job_role, :text)
    end
end