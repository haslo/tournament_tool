module Android
  class NetrunnerTournament < ::Tournament

    def tournament_type
      'Android:Netrunner'
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
