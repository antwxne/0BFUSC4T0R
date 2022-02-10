Hash Trigraphes = Hash['#' => "??=",
                      '[' => "??(",
                      ']' => "??)",
                      '/' => "??\\",
                      '^' => "??'",
                      '{' => "??<",
                      '|' => "??!",
                      '}' => "??>",
                      '~' => "??-"
                     ]

Hash Digraphes = Hash['#' => "%:",
                     '[' => "<:",
                     ']' => ":>",
                     '{' => "<%",
                     '}' => "%>",
                     ]

if __FILE__ == $0
  begin
  file_in = open(ARGV[1], 'r')
  file_out = open(ARGV[2], 'w')

  file_in.each_char do |c|
    if ARGV[0] == "-d" and Digraphes.key?(c)
      file_out.write(Digraphes[c])
    elsif ARGV[0] == "-t" and Trigraphes.key?(c)
      file_out.write(Trigraphes[c])
    else
      file_out.write(c)
    end
  end
  file_in.close
  file_out.close
  rescue
    puts "usage:\n\
ruby obfuscator.rb <mode> <input file> <output file>\n\n\
flags:\n\
-t: for trigraphes\n\
-d: for digraphes"
  end
end
