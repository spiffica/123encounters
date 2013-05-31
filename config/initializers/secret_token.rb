# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Encounters::Application.config.secret_token = ENV['SECRET_TOKEN'] || '71b5670454424291b82122cf18651e050f29fc69bef886b20ec3390b0f837feb15de35bf1cbaf32521a379ad831d2b4fea0eb08953744c37787efe36e6f062a2'
