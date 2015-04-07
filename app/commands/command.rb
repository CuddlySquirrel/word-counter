class Command

  class Command::NotImplementedError < StandardError; end

  def run(*args)
    execute(*args)
  end

  def execute(*args)
    raise NotImplementedError, "#{self.class.name} does not implement an execute method"
  end

end
