class IndexWorker
  #TODO make this overridable so different classes don't share the same queue
  @queue = :resque_reindex

  @rails_version = Rails::VERSION::STRING

  def self.perform(klass, ids)
    case rails_3?
    when true
      objs = klass.constantize.find_all_by_id(ids)
    when false
      objs = klass.constantize.where(id: ids)
    end
    Sunspot.index!(objs)
  end

  def rails_3?
    @rails_version.start_with?("3.")
  end
end
