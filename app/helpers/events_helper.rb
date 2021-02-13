module EventsHelper
  def Event.past
    self.select do |event|
      event.date < Date.today.to_s
    end
  end

  def Event.upcoming
    self.select do |event|
      event.date > Date.today.to_s
    end
  end
end
