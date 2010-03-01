# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mapplication_session',
  :secret      => '7de4022f57c0ae650f84c75179dd2b63ebd56ecee6a989bcb7160ac56c627e1b99270dc2d139befd9a0839e6bfa38737f4f9cdb04a42050aea5f777ff547e78a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
