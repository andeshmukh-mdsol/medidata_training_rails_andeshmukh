class StudiesController < ApplicationController
    skip_before_action :verify_authenticity_token #for skipping authenticity while calling from terminal or postman tool
    
    # before_action :verify_authenticity_token
    # after_action :demo_after_action only:[:index]
    # around_action :demo_around_action

    def new
    end

    
    def create 
        @study = Study.new(study_params)
        if @study.save
            render json: {notice: "Study created successfully!"}
        else
            render json: {error: "Could not create study!"}
        end
    end

    def index 
        p "Index method called......."
        @studies = Study.all
        # render json: @studies
    end

    def update 
        @study = Study.find(params[:id])

        if @study 
            @study.update(study_params)
            render json:{notice: "Study updated successfully"}
        else
            render json:{error: "could not find the study"}
        end
    end

    def destroy
        @study = Study.find(params[:id])

        if @study
            @study.destroy
            render json:{notice: "Study deleted successfully"}
        else
            render json:{error: "could not find the study"}
        end
    end

    def active 
    end



    private

    def study_params
        params.require(:study).permit(:name, :age_limit, :drug, :phase, :symptoms, :study_group_id)
    end

    def demo_after_action
        p "this is called after action......."
    end
end

#CRUD - create read update destroy