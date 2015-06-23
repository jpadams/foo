raw = File.open('/tmp/output.yaml')
clean = File.open('/tmp/itsclean.yaml','w')

raw.readlines.each do |line|
  #skip blank lines
  if line.chomp == '' then
    next
  end
  l = line.chomp.strip.gsub(/\s+:/, ':').gsub(/^([^:]+)(:\s?)([\s\S]*)$/, "\"\\1\": \"\\3\"")
  puts l
end

clean.close()
raw.close()
