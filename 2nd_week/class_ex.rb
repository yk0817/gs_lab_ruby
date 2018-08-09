class Instance
  # インスタンス化した際、最初に実行されるメソッド
  def initialize
    @instance_variable = "instance"
    p 'test'
  end

  # インスタンスメソッド
  def instance_method
    p @instance_variable
  end

  # クラスメソッド
  def self.klass_method
    p "test"
  end

end
Instance.klass_method
Instance.new.instance_method
