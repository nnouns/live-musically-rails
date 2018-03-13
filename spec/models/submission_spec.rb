RSpec.describe Submission, type: :model do
	describe "ActiveModel associations" do
		# belongs_to
		it "belongs to an opportunity" do
			expect(subject).to belong_to(:opportunity)
		end

		it "belongs to an user" do
			expect(subject).to belong_to(:user)
		end
	end
end
