namespace :ssh do
  desc <<-DESC
    Uploads a shared key to the given host
  DESC
  task :key, [:user, :key] do |t, args|
    file = args.key

    if not File.exists?(file) or not File.exists?("#{file}.pub")
      fail "SSH key #{args.key} does not exist."
    end

    on roles(:all) do |s|
      homedir = capture("echo $(eval echo ~#{args.user})")
      if (test("[ -d #{homedir} ]"))
        sshdir = "#{homedir}/.ssh"
        sudo "mkdir -p #{sshdir}"
        upload_to file, sshdir
        upload_to "#{file}.pub", sshdir
      else
        fail "#{args.user} does not exist on #{s}"
      end
    end
  end

  desc <<-DESC
    Runs an arbitrary SSH command and prints the output
  DESC
  task :cmd, [:command] do |t, args|
    on roles(:all) do |s|
      puts capture("sudo #{args.command}")
    end
  end

  def upload_to src, dst
    if File.exists?(src)
      file = File.basename(src)
      upload! src, './'
      sudo "mv ./#{file} #{dst}"
    end
  end
end
