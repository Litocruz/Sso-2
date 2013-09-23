class DriverLicensesController < ApplicationController
  #before_filter :signed_in_employee
  #before_filter :admin_employee

  def create
    @driver_license = current_employee.driver_licenses.build(params[:driver_license])
    if @driver_license.save
      flash[:success] = "Licencia de Conducir Creada"
      redirect_to current_employee
    else
      render 'static_pages/home'
    end
  end

  def destroy
    driver_license=DriverLicense.find(params[:id])
    DriverLicense.find(params[:id]).destroy
    flash[:success] = "Licencia de Conducir Eliminada"
    redirect_to employee_path(driver_license.employee)
  end
end
