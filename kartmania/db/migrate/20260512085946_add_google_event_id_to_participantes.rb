class AddGoogleEventIdToParticipantes < ActiveRecord::Migration[7.1]
  def change
    add_column :participantes, :google_event_id, :string
  end
end
