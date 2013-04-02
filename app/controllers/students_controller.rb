class StudentsController < ApplicationController
  respond_to :html, :xml, :json
  
  def index
    @search = current_user.students.search(params[:q])
    @students = @search.result.paginate(page: params[:page])

    respond_with(@students)
  end

  def show
  end
end
