require 'rails_helper'

RSpec.describe 'students show page' do
  before(:each) do
    @student_1 = Student.create!(name: "Bert", age: 18, house: "Hufflepuff")
    @student_2 = Student.create!(name: "Ernie", age: 16, house: "Slytherin")
    @course_1 = @student_1.courses.create!(name: "Defense against the Dark Arts")
    @course_2 = @student_1.courses.create!(name: "Herbology")
    @course_3 = @student_1.courses.create!(name: "Potions")
  end

  describe 'when I visit a students show page' do
    it 'displays a list of the students courses' do
      visit "/students/#{@student_1.id}"

      expect(page).to have_content(@course_1.name)
      expect(page).to have_content(@course_2.name)
      expect(page).to have_content(@course_3.name)
    end
  end
end
