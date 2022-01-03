class HardWorker
  include Sidekiq::Worker

  def perform(*args)
    Post.create(body: "test #{Time.now.to_s}", user: User.first)
  end
end
