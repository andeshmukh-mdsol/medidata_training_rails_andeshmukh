class StudiesController < ApplicationController
    skip_before_action :verify_authenticity_token #for skipping authenticity while calling from terminal or postman tool
    require 'pry'
    # before_action :verify_authenticity_token
    # after_action :demo_after_action only:[:index]
    # around_action :demo_around_action

    def new
        @study = Study.new()
    end

    def create 
        @study = Study.new(study_params)
        if @study.save
            redirect_to(study_group_studies_path(params[:study_group_id]))
        else
            render('new')
        end
    end

    def index 
        p "Index method called......."
        @studies = Study.where(study_group_id:params[:study_group_id])
        # render json: @studies
    end

    def show 
    end

    def edit
        @study = Study.find(params[:id])
    end
    
    def update 
        @study = Study.find(params[:id])

        if @study 
            @study.update(study_params)
            redirect_to(study_group_studies_path(params[:study_group_id]))
        else
            render json:{error: "could not find the study"}
        end
    end

    def destroy
        @study = Study.find(params[:id])

        if @study
            @study.destroy
            redirect_to(study_group_studies_path(params[:study_group_id]))
        else
            render json:{error: "could not find the study"}
        end
    end

    def active 
    end



    private

    def study_params
        params.require(:study).permit(:name, :age_limit, :drug, :phase, :symptoms, :study_group_id, :my_image)
    end

    def demo_after_action
        p "this is called after action......."
    end
end

#CRUD - create read update destroy