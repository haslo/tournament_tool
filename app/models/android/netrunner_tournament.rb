module Android
  class NetrunnerTournament < ::Tournament

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
