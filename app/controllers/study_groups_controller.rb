class StudyGroupsController < ApplicationController
  def index
    @study_groups = StudyGroup.all
  end

  def show
  end

  def new
    @study_group = StudyGroup.new()
  end

  def create
    @study_group = StudyGroup.new(studygroup_attr)
    if @study_group.save
      redirect_to(study_groups_path)
    else
      render('new')
    end
  end

  def edit
    @study_group = StudyGroup.find(params[:id])
  end

  def update 
    @study_group = StudyGroup.find(params[:id])
    if @study_group.update(studygroup_attr)
      redirect_to(study_groups_path)
    else
      render('edit')
    end
  end

  def delete
  end

  def destroy
    @study_group = StudyGroup.find(params[:id])
    if @study_group.destroy
      redirect_to(study_groups_path)
    else
      render json:{error: "could not find the study"}
    end
  end

  private

  def studygroup_attr
    params.require(:study_group).permit(:name)
  end
end
