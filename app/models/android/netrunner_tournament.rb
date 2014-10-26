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

    def participant_type
      Android::NetrunnerParticipant
    end

    def default_stages_key_for(count)
      case count
        when 2..10
          'types.default_stages.netrunner.swiss'
        else
          nil
      end
    end

  end
end
