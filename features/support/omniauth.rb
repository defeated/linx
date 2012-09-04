# put omniauth in test mode
OmniAuth.config.test_mode = true
OmniAuth.config.add_mock :google, {
  info: { email: "cucumber@litmusapp.com" }
}
