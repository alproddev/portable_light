# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_portablelight_session',
  :secret      => 'ad2c914e8d9f772ac80477ca50bfd2f7854c22915ef8d731209277ccf4f1fbb1b69727b6326acd4f28c170226e9982ba0d0c32086e06b865b4e491e32ae7f4cf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
