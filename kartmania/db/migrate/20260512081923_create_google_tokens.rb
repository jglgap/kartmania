class CreateGoogleTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :google_tokens do |t|
      t.text :access_token
      t.text :refresh_token
      t.datetime :expires_at

      t.timestamps
    end
  end
end
