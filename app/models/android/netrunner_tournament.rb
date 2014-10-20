module Android
  class NetrunnerTournament < ::Tournament

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
