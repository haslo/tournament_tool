module TypeHelper

  def select_options_from_types(types)
    types.map do |type|
      if type.respond_to?(:type_description)
        ["#{type.type_name} (#{type.type_description})", type.name]
      else
        [type.type_name, type.name]
      end
    end
  end

end
