class foo {
  notify{"readying data from the yaml file":} 
  include 'stdlib' 
  # calling my custom function included in this module
  prepyaml()
  $data = loadyaml('/tmp/itsclean.yaml')
  $thehost = $data["Host ID"] 
  notify{"The value is: ${thehost}":}
}
