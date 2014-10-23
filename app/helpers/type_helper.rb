module TypeHelper

  def select_options_from_types(types)
    types.map do |type|
      [type.type_name, type.name]
    end
  end

end
