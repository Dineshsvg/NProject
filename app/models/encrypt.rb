require 'openssl'
class Crypto
  def initialize(key, iv, data, cipher='aes-256-cbc')
    @key = key 
    @iv = iv
    @cipher = cipher
    @data = data
  end 

  def encrypt
    c = OpenSSL::Cipher.new(@cipher).encrypt
    c.iv = @iv 
    c.key = @key
    c.update(@data) + c.final    
  end 

  def decrypt
    c = OpenSSL::Cipher.new(@cipher).decrypt
    c.iv = @iv 
    c.key = @key
    c.update(@data) + c.final    
  end 
end

iv = '0'*16
key = '1'*32
message = 'My Message' 
encrypted = Crypto.new(key,iv,message).encrypt
puts Crypto.new(key,iv,encrypted).decrypt
puts `echo -n '#{encrypted}' | openssl aes-256-cbc -d -K #{key.unpack('H*').first} -iv #{iv.unpack('H*').first}`

