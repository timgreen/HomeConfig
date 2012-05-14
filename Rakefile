require 'rake'

def filelist
  Dir.glob('**/*', File::FNM_DOTMATCH).reject { |f|
    f == 'Rakefile' || f == 'README.md' ||
      f =~ /\.$/ ||
      f =~ /\.git\// || f =~ /\.git$/ ||
      f =~ /\.gitignore$/ || f =~ /\.gitattributes$/ || f =~ /\.gitmodules$/
  }
end

def mk_parent_dir(target)
  dir = File.dirname(target)
  FileUtils.mkdir_p(dir)
  true
end

desc 'Update submodule'
task 'update-submodule' do
  `git submodule update`
end

desc 'Check Status'
task :check => 'update-submodule' do
  files = filelist
  files.each do |f|
    target = "#{ENV["HOME"]}/#{f}"
    status = '[ YES ]'
    if File.directory?(f)
      if File.exist?(target)
        if File.symlink?(target)
          status = '[ ERROR - DIR IS SYMLINK ]'
        end
      else
        status = '[ DIR MISSING ]'
      end
    else
      if File.exist?(target)
        if File.symlink?(target)
          if File.realpath(target) != File.realpath(f)
            status = '[ ERROR - FILE SYMLINK NOT MATCH ]'
          end
        else
          status = '[ ERROR - FILE IS NOT SYMLINK ]'
        end
      else
        status = '[ FILE MISSING ]'
      end
    end

    puts "#{status} #{f}" if status != '[ YES ]'
  end
end

desc 'Install config'
task 'install-config' => ['update-submodule'] do
  files = filelist
  files.each do |f|
    target = "#{ENV["HOME"]}/#{f}"
    if !File.exist?(target) && mk_parent_dir(target)
      if File.directory?(f)
        FileUtils.mkdir(target)
      else
        File.symlink(File.realpath(f), target)
      end
    end
  end
end

desc 'Post install'
task 'post-install' do
  # compile terminfo
  `tic ~/.terminfo/mostlike.txt -o ~/.terminfo/`
end

desc 'Install config to home directory.'
task :install => ['install-config', 'post-install']

desc 'Pre uninstall'
task 'pre-uninstall' do
  # remove compiled terminfo
  `rm -fr ~/.terminfo/*/`
end

desc 'Uninstall config from home directory'
task :uninstall => ['update-submodule', 'pre-uninstall'] do
  files = filelist
  files.sort.reverse_each do |f|
    target = "#{ENV["HOME"]}/#{f}"
    if File.exist?(target)
      if File.realpath(target) == File.realpath(f)
        File.delete(target)
      elsif File.directory?(target) && File.directory?(f)
        FileUtils.rmdir(target)
      end
    end
  end
end
