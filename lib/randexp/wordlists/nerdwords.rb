class RealName
  def self.load_nerdwords
    dir = File.dirname(__FILE__)
    if File.exists?("#{dir}/../../../wordlists/nerdwords")
      File.read("#{dir}/../../../wordlists/nerdwords").split
    else
      raise "nerdwords file not found"
    end
  end

  def self.nerdwords(options = {})
    if options.has_key?(:length)
      nerdwords_by_length[options[:length]]
    else
      @@nerdwords ||= load_nerdwords
    end
  end

  def self.nerdwords_by_length
    @@nerdwords_by_length ||= nerdwords.inject({}) {|h, w| (h[w.size] ||= []) << w; h }
  end
end
