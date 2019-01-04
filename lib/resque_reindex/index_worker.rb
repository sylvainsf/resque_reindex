class ResqueReindex::IndexWorker
  #TODO make this overridable so different classes don't share the same queue
  @queue = :resque_reindex

  @rails_version = Rails::VERSION::STRING

  def self.perform(klass, ids)
    objs = klass.constantize.where(id: ids)
    Sunspot.index!(objs)
  end
end
