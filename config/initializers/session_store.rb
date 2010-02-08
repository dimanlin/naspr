# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_naspr_session',
  :secret      => '4c1c5278362813c55a01f7d72697cd23bac58e65c938a7ca1789e022d0f476bbeb36cd9b8e5fff96fdcbcef1be39bbcfc12aa2ef3be785422e2b67e67b44b901'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
