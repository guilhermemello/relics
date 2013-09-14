# encoding: utf-8

module Kernel
  def p(value)
    puts "\n\n"
    puts "========================================================================== DEBUG ========================================================================".bold.white_on_blue
    puts "\n"
    puts "Classe  => ".bold.black + value.class.to_s
    puts "Inspect => ".bold.black + value.inspect

    if value.is_a? Array
      puts "Tamanho => ".bold.black + value.size.to_s
    end

    puts "\n"
    puts "=========================================================================================================================================================".bold.white_on_blue
  end
end
