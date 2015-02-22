class GlobalConfig < ActiveRecord::Base

  def value
    return self.value_str.to_s if self.class_str == "String"
    return self.value_str.to_i if self.class_str == "Integer"
    return self.value_str.to_f if self.class_str == "Float"
    return self.value_str.to_b if self.class_str == "Boolean"
  end

  class << self
    def store(options)
      key, val, class_str = options[:key].to_s, options[:value_str].to_s, (options[:class_str] || 'String').to_s
      global_config = GlobalConfig.find_or_create_by(key: key)
      global_config.update_columns(value_str: val, class_str: class_str)
      save_cache(key, val)
    end

    def delete(key)
      global_config = GlobalConfig.find_by(key: key.to_s)
      global_config.destroy
    end

    def save_cache(key, val)
      Rails.cache.write(key, val)
    end

    def read_cache(key)
      key = key.to_s
      Rails.cache.read(key)
    end
  end

end
