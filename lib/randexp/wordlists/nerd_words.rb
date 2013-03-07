class RealName
  def self.load_nerd_words
    dir = File.dirname(__FILE__)
    if File.exists?("#{dir}/../../../wordlists/nerd_words")
      File.read("#{dir}/../../../wordlists/nerd_words").split
    else
      raise "nerd_words file not found"
    end
  end

  def self.nerd_words(options = {})
    if options.has_key?(:length)
      nerd_words_by_length[options[:length]]
    else
      @@nerd_words ||= load_nerd_words
    end
  end

  def self.nerd_words_by_length
    @@nerd_words_by_length ||= nerd_words.inject({}) {|h, w| (h[w.size] ||= []) << w; h }
  end
end
