class Time
  class << self
    attr_accessor :stub_to

    alias __now now
    def now
      stub_to || __now
    end

  end
end

Around '@time-frozen' do |scenario, block|
  Time.stub_to = Time.at(123456789)
  block.call
  Time.stub_to = nil
end
