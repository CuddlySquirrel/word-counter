require 'rails_helper'

module CommandSpec
  class GoodCommand < Command
    def execute
    end
  end

  class BadCommand < Command
    def no_execute_method
    end
  end
end

describe Command do

  describe "public instance methods" do
    it { expect(subject).to respond_to(:run) }
  end

  describe "#run" do
    it "calls execute" do
      command = CommandSpec::GoodCommand.new
      expect(command).to receive(:execute)
      command.run
    end
  end

  describe "#execute" do
    it "raises a not implemented error" do
      command = CommandSpec::BadCommand.new
      expect { command.execute }.to raise_error(Command::NotImplementedError)
    end
  end

end
