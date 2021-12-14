require 'rails_helper'

RSpec.describe 'students index' do
  before(:each) do
    @student_1 = Student.create!(name: "Bert", age: 18, house: "Hufflepuff")
    @student_2 = Student.create!(name: "Ernie", age: 16, house: "Slytherin")
    @course_1 = @student_1.courses.create!(name: "Math")
  end

  describe 'when I visit the students index page' do
    it ' shows a list of students with their age and house' do
      visit "/students"

      expect(page).to have_content(@student_1.name)
      expect(page).to have_content(@student_1.age)
      expect(page).to have_content(@student_1.house)
    end
    it 'shows the average age of all students' do
      visit "/students"
      expect(page).to have_content("Average Age: 17")
    end
  end
end
