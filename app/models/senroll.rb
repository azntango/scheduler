class Senroll < ActiveRecord::Base
	belongs_to :user
	belongs_to :course
	belongs_to :section
	has_many :attendances, dependent: :destroy
	has_many :jenrolls, :through => :mentorjoins
	has_many :mentorjoins
	
	def getStudents()
		@section = Section.find(self.section_id)
		users = []
		@section.enrolls.each do |enroll|
			curr_user = User.find(enroll.user_id)
			users << curr_user
		end
		return users
	end
end
