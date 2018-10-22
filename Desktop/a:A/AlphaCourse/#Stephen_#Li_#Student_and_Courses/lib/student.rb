class Student
  attr_accessor :name, :courses

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @name = first_name + " " + last_name
    @courses = []
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def enroll(course)
    raise "error" if @courses.any? {|enrolled_course| enrolled_course.conflicts_with?(course)}
    if @courses.include?(course)
      @courses
    else
      @courses << course
    end
    course.students << self
  end


  def course_load
    ans = Hash.new(0)

    @courses.each do |course|
      ans[course.department] += course.credits
    end
    ans

  end

end
