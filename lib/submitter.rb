require "submitter/version"

module Submitter
	module models
  # Your code goes here...
		class job_application(:application)
			def new
				JobApplication.new
			end
		end
	end
end
