class MessageOut
  def self.before_validation(obj)
    puts "#{obj.model_name}バリデーション前メッセージ！！！！！"
  end
  def self.before_save(obj)
    puts "#{obj.model_name}保存前メッセージ！！！！！"
  end
end
