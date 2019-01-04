require "resque_reindex/version"
require "resque_reindex/index_worker"

module ResqueReindex
  def resque_reindex
    ids = pluck(:id)
    Resque.enqueue(ResqueReindex::IndexWorker, self.name.to_s, ids)
  end
end
