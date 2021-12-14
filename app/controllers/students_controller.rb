class StudentsController < ApplicationController
  def index
    @students = Student.all
    @average = @students.average_age
  end

  def show
    student = Student.find(params[:id])
    @courses = student.courses
  end
end
