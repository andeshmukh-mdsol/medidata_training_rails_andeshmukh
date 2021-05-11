class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new()
  end

  def create 
    @subject = Subject.new(strong_params)
    if @subject.save
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  private 

  def strong_params
    params.require(:subject).permit(:name, :age, :email)
  end

end
