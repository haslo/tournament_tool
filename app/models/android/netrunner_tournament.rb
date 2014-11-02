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

    def default_stages_key
      case participants.count
        when 3..9
          'types.default_stages.netrunner.swiss'
        when 10..20
          'types.default_stages.netrunner.swiss_with_cut'
        else
          nil
      end
    end

    def create_default_stages
      if stages.none?
        stage_params = {
          tournament: self,
          minutes_per_round: 60, # TODO look up
          minutes_per_break: 10
        }
        case participants.count
          when 3..5
            stages << Android::NetrunnerSwissStage.create(stage_params.merge({title: I18n.t('types.default_stages.netrunner.swiss_tournament_title'), number_of_rounds: 2}))
          when 6..7
            stages << Android::NetrunnerSwissStage.create(stage_params.merge({title: I18n.t('types.default_stages.netrunner.swiss_tournament_title'), number_of_rounds: 3}))
          when 8..9
            stages << Android::NetrunnerSwissStage.create(stage_params.merge({title: I18n.t('types.default_stages.netrunner.swiss_tournament_title'), number_of_rounds: 4}))
          when 10..20
            stages << Android::NetrunnerSwissStage.create(stage_params.merge({title: I18n.t('types.default_stages.netrunner.swiss_stage_title'), number_of_rounds: 4}))
            stages << Android::NetrunnerEliminationStage.create(stage_params.merge({title: I18n.t('types.default_stages.netrunner.finals_stage_title'), number_of_rounds: 3, maximum_number_of_participants: 8}))
          else
            nil
        end
        stages.any?
      else
        false
      end
    end

  end
end
