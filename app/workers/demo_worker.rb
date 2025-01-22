class DemoWorker
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 3

  def perform(name)
    logger.info "Bonjour, je suis un Worker ! Hello #{name}!"
  end
end
