class EnrollmentsController < ApplicationController
  def index
  end

  def new
    @enrollment = Enrollment.new()
    @studies = Study.all
    @subjects = Subject.joins("LEFT JOIN enrollments on subjects.id = subject_id where subject_id IS NULL")
  end

  def create 
    
    @enrollment = Enrollment.new(strong_params)
    if @enrollment.save 
      flash[:notice] = 'Enrollment done successfully'
      EnrollmentMailer.with(enrollment: @enrollment).delay.success_enrollment
      redirect_to(new_enrollment_path)
    else
      flash[:notice] = 'Enrollment failed!'
      render('new')
    end
  end

  private 

  def strong_params
    params.require(:enrollment).permit(:study_id, :subject_id)
  end

end
