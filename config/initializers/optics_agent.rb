if ENV['OPTICS_API_KEY']
  optics_agent = OpticsAgent::Agent.new
  optics_agent.configure { schema LandbnbSchema }
  Rails.application.config.middleware.use optics_agent.rack_middleware
end
