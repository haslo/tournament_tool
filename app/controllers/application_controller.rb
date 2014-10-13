class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  private

  def decorate(model)
    if defined?("#{model.class.name}Decorator".constantize.new)
      "#{model.class.name}Decorator".constantize.new(model)
    else
      model
    end
  end

  def decorate_list(list)
    list.map do |item|
      if defined?("#{item.class.name}Decorator".constantize.new)
        "#{item.class.name}Decorator".constantize.new(item)
      else
        item
      end
    end
  end

end
