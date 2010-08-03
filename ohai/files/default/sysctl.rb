# Plugin to pull sysctl data 
provides 'sysctl'



sysctl Mash.new

# platform detection should go here
# right now only centos/linux tested
cmd = "sysctl -A"

status, stdout, stderr = run_command(:command => cmd)
return "" if stdout.nil? || stdout.empty?
stdout.each do |line|
  line.chomp  
  k,v = line.split(/=/) 
  sysctl[k.strip!] = v.strip!
end

