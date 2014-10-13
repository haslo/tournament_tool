module ApplicationHelper

  def bootstrap_class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-warning',
      alert: 'alert-danger',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

end
