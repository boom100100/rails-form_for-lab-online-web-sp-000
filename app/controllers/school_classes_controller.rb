class SchoolClassesController < ApplicationController
  def index
    @school_classes = SchoolClass.all
  end
  
  def show
    @school_class = SchoolClass.find(params[:id])
  end
  
  def new
    @school_class = SchoolClass.new
  end #SchoolClassesController#new is missing a template for this request format and variant.
  #NOTE! For XHR/Ajax or API requests, this action would normally respond with 204 No Content: an empty white screen. Since you're loading it in a web browser, we assume that you expected to actually render a template, not nothing, so we're showing an error to be extra-clear. If you expect 204 No Content, carry on. That's what you'll get from an XHR or API request. Give it a shot.
     
  
  def edit
    @school_class = SchoolClass.find(params[:id])
  end
  
  def create
    @school_class = SchoolClass.new(post_params(:title, :room_number))
    @school_class.save
    
    redirect_to school_class_path(@school_class)
  end
  
  
  def update
    @school_class = School_class.find(params[:id])
    @school_class.update(post_params(:title, :room_number))
    @school_class.save
    
    redirect_to school_class_path(@school_class)
  end
  
  private
	def post_params(*args)
    params.require(:school_class).permit(*args)
  end
  
end
