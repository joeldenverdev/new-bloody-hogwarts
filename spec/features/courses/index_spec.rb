require 'rails_helper'

RSpec.describe 'courses index page' do
  before(:each) do
    # @student_1 = Student.create!(name: "Bert", age: 18, house: "Hufflepuff")
    # @student_2 = Student.create!(name: "Ernie", age: 16, house: "Slytherin")
    # @student_3 = Student.create!(name: "Cookie Monster", age: 16, house: "Slytherin")
    # @student_4 = Student.create!(name: "Big Bird", age: 16, house: "Slytherin")
    # @student_5 = Student.create!(name: "Someone", age: 16, house: "Slytherin")
    # @course_1 = @student_1.courses.create!(name: "Defense against the Dark Arts")
    # @course_2 = @student_1.courses.create!(name: "Herbology")
    # @course_3 = @student_1.courses.create!(name: "Potions")
    # # @course_3 = @student_2.courses.create!(name: "Potions")
    # # @course_3 = @student_3.courses.create!(name: "Potions")
    # # @course_4 = @student_1.courses.create!(name: "Spells")
    # # @course_4 = @student_5.courses.create!(name: "Spells")

    @course_1 = Course.create!(name: "Defense against the Dark Arts")
    @course_2 = Course.create!(name: "Herbology")
    @course_3 = Course.create!(name: "Potions")

    @student_1 = Student.create!(name: "Bert", age: 18, house: "Hufflepuff")
    @student_2 = Student.create!(name: "Ernie", age: 16, house: "Slytherin")
    @student_3 = Student.create!(name: "Cookie Monster", age: 16, house: "Slytherin")
    @student_4 = Student.create!(name: "Big Bird", age: 16, house: "Slytherin")
    @student_5 = Student.create!(name: "Someone", age: 16, house: "Slytherin")
    StudentCourse.create!(student_id: @student_1.id, course_id: @course_1.id)
    StudentCourse.create!(student_id: @student_1.id, course_id: @course_2.id)
    StudentCourse.create!(student_id: @student_1.id, course_id: @course_3.id)
    StudentCourse.create!(student_id: @student_2.id, course_id: @course_2.id)
    StudentCourse.create!(student_id: @student_2.id, course_id: @course_3.id)
    StudentCourse.create!(student_id: @student_3.id, course_id: @course_2.id)
    StudentCourse.create!(student_id: @student_3.id, course_id: @course_3.id)
    StudentCourse.create!(student_id: @student_4.id, course_id: @course_1.id)
    StudentCourse.create!(student_id: @student_5.id, course_id: @course_1.id)
    StudentCourse.create!(student_id: @student_5.id, course_id: @course_2.id)

  end

  describe 'when I visit the courses index page' do
    it 'shows a list of courses and the number of students enrolled' do
      visit "/courses"

      expect(page).to have_content("Defense against the Dark Arts: 3")
      expect(page).to have_content("Herbology: 4")
      expect(page).to have_content("Potions: 3")
    end
  end
end
