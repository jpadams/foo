module Puppet::Parser::Functions

  newfunction(:prepyaml) do |args|
    unless args.length == 0
      raise Puppet::ParseError, ("loadyaml(): wrong number of arguments (#{args.length}; must be 0)")
    end

    raw = File.open('/tmp/output.yaml')
    clean = File.open('/tmp/itsclean.yaml','w')

    raw.readlines.each do |line|
      #skip blank lines
      if line.chomp == '' then
        next
      end
      l = line.chomp.strip.gsub(/\s+:/, ':').gsub(/^([^:]+)(:\s?)([\s\S]*)$/, "\"\\1\": \"\\3\"")
      clean.puts l
    end

    clean.close()
    raw.close()
  end
end
