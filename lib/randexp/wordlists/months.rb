class RealName
  def self.load_months
    dir = File.dirname(__FILE__)
    if File.exists?("#{dir}/../../../wordlists/months")
      File.read("#{dir}/../../../wordlists/months").split
    else
      raise "months file not found"
    end
  end

  def self.months(options = {})
    if options.has_key?(:length)
      months_by_length[options[:length]]
    else
      @@months ||= load_months
    end
  end

  def self.months_by_length
    @@months_by_length ||= months.inject({}) {|h, w| (h[w.size] ||= []) << w; h }
  end
end
