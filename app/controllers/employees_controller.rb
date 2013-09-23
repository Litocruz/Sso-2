class EmployeesController < ApplicationController
  before_filter :signed_in_user
  #before_filter :correct_employee
 # before_filter :admin_user
  before_filter :load

  def load
    @employees = Employee.paginate(page: params[:page])
    @employee = Employee.new
  end

  def index
    #@employees = Employee.paginate(page: params[:page])
    #respond_to do |format|
     # format.html
      #format.json { render json: EmployeesDatatable.new(view_context) }
    #end
  end

  #def show
   # @employee = Employee.find(params[:id])
    #@driver_licenses = @employee.driver_licenses.paginate(page: params[:page])
  #end

  #def new
   # @employee = Employee.new
    #1.times { @employee.driver_licenses.build}
  #end

  def create
    @employee = Employee.new(params[:employee])
    if @employee.save
      #sign_in @employee
      flash[:success] = "Nuevo Empleado Creado"
      @employees = Employee.paginate(page: params[:page])
      @employee.driver_licenses.build
     # redirect_to @employee
    #else
     # render 'new'
    end
  end

  def edit
    @employee = Employee.find(params[:id])
    1.times { @employee.driver_licenses.build}
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update_attributes(params[:employee])
      flash[:success] = "Perfil Actualizado"
      #sign_in @employee
      #redirect_to @employee
      @employees = Employee.paginate(page: params[:page])
    #else
     # render 'edit'
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.update_attribute(:status,false)
      flash[:success] = "Empleado dado de baja"
      #redirect_back_or employees_path
      @employees = Employee.paginate(page: params[:page])
    #else
     # render 'index'
    end
  end

  #METODOS PRIVADOS
  private
    def correct_employee
      @employee = Employee.find(params[:id])
      redirect_to(root_path) unless current_user?(@employee)
    end

end
