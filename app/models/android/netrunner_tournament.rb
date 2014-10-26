module Android
  class NetrunnerTournament < ::Tournament

    def self.json_data_field_descriptions
      [
        {name: :number_of_tables, data_type: Integer}
      ]
    end

    def self.type_key
      :netrunner
    end

    def stage_types
      [
        Android::NetrunnerSwissStage,
        Android::NetrunnerEliminationStage,
        Android::NetrunnerDoubleEliminationStage,
        Android::NetrunnerRoundRobinStage
      ]
    end

  end
end
