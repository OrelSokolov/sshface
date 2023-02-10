require "sshface/version"
require 'etc'
require 'colorize'

module Sshface
  class Error < StandardError; end
  # Your code goes here...

  class Setter
    def face_list
      list = []
      Dir.chdir("#{Etc.getpwuid.dir}/") do
        list = Dir.glob('.ssh-*').select { |f| File.directory? f }
      end
      list
    end

    def set_face(face)
      `unlink ~/.ssh`
      `ln -s #{face} ~/.ssh`
    end

    def face_loop
      face_hash = face_list.map.with_index{|e, index| [index, e]}.to_h

      face_hash.each do |k, v|
        puts "#{k}. #{v}"
      end

      puts "Select face number: "

      name = nil

      loop do
        name = gets.chomp.to_i
        break if face_hash.keys.include? name
        puts "Wrong choice"
      end

      puts "Selected: #{face_hash[name]}"

      set_face(face_hash[name])

      puts "All set".colorize(:green)
    end
  end
end
