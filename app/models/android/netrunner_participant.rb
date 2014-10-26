module Android
  class NetrunnerParticipant < ::Participant

    def self.json_data_field_descriptions
      [
        {name: :runner, data_type: String},
        {name: :runner_faction, data_type: String},
        {name: :corporation, data_type: String},
        {name: :corporation_faction, data_type: String}
      ]
    end

  end
end
