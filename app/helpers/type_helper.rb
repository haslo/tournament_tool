module TypeHelper

  def select_options_from_types(types, i18n_key)
    types.map do |type|
      [t("types.#{i18n_key}.#{type.type_key}"), type.name]
    end
  end

end
