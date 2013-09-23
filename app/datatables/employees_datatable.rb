class EmployeesDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Employee.count,
      iTotalDisplayRecords: employees.total_entries,
      aaData: data
    }
  end

  private

  def data
    employees.map do |employee|
      [
        link_to(employee.name, employee),
        h(employee.address),
        employee.documento_number,
        employee.documento_type,
        h(employee.created_at.strftime("%B %e, %Y")),
        link_to ("Editar", edit_employee_path(employee))
      ]
    end
  end

  def employees
    @employees ||= fetch_employees
  end

  def fetch_employees
    employees = Employee.order("#{sort_column} #{sort_direction}")
    employees = employees.page(page).per_page(per_page)
    if params[:sSearch].present?
      employees = employees.where("name like :search or address like :search", search: "%#{params[:sSearch]}%")
    end
    employees
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name address documento_number]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end
