require "resque_reindex/version"

module ResqueReindex
  def self.resque_reindex
    ids = self.pluck(:id)
    ResqueReindex::IndexWorker.enqueue(self.class.to_s, ids)
  end
end
