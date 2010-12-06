require 'tmpdir'

class SHackWorld
  def initialize
    rvm_path     = File.dirname(File.dirname(ENV['MY_RUBY_HOME']))
    rvm_lib_path = File.join(rvm_path, 'lib')
    $LOAD_PATH.unshift rvm_lib_path
    require 'rvm'
    
    @tempdir = nil
    @stdout = ""
  rescue LoadError => e
    puts "to execute the tests you have to install RVM (Ruby Version Manager)"
  end
  
  def sandbox
    @tempdir = Dir.mktmpdir "tmpshack" if @tempdir.nil?
    @tempdir
  end
  
  def register_stdout text
    @stdout = text
  end
  
  def comm_stdout
    @stdout
  end
  
  def get_ios
    @ios
  end

  def ruby(args, stderr = nil )
    config       = ::Config::CONFIG
    interpreter  = File::join(config['bindir'], config['ruby_install_name']) + config['EXEEXT']
    cmd = "#{interpreter} #{args} 2>&1"
#    puts cmd
    @stdout = `#{cmd}`
    return false if $?.exitstatus != 0
    true 
  end
  
  def p_ruby(args, stderr = nil )
    config       = ::Config::CONFIG
    interpreter  = File::join(config['bindir'], config['ruby_install_name']) + config['EXEEXT']
    cmd = "#{interpreter} #{args} 2>&1"
    @ios = IO.popen(cmd,"r+")
    @ios
  end

end

World do
  SHackWorld.new
end

