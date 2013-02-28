class ResourcesController < ApplicationController
  def index
    @resources = current_user.resources.order(:title)
  end
  
  def destroy
    @resource = current_user.resources.find(paams[:id])
    @resource.destroy
  end
end
