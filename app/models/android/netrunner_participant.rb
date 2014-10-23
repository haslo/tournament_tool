module Android
  class NetrunnerParticipant < ::Participant

    def self.json_data_fields
      [
        :runner,
        :runner_faction,
        :corporation,
        :corporation_faction,
      ]
    end

  end
end
