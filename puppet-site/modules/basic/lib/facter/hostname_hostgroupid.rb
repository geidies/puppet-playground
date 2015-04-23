Facter.add("hostgroupid") do
  setcode do
    hostname = Facter.value('hostname')
    trimhostname = hostname.gsub(/[-\d]+$/, '')
    trimhostname
  end
end
