cask 'vmware-fusion-tech-preview' do
  version '15468164'
  sha256 '6e18715d79196f79579cc2d43dced13b5c013cb835493aed610edadb4e82ca01'

  # download3.vmware.com/ was verified as official when first introduced to the cask
  url "https://download3.vmware.com/software/fusion/file/VMware-Fusion-e.x.p-#{version}.dmg"
  name 'VMware Fusion Tech Preview'
  homepage 'https://vmwarefusion.github.io/'

  auto_updates true
  conflicts_with cask: 'vmware-fusion'
  depends_on macos: '>= :sierra'

  app 'VMware Fusion Tech Preview.app'
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vkd/bin/vctl"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmnet-bridge"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmnet-cfgcli"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmnet-cli"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmnet-dhcpd"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmnet-natd"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmnet-netifup"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmnet-sniffer"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmrun"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmrest"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmss2core"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-aewp"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-authd"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-cloneBootCamp"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-id"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-ntfs"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-rawdiskAuthTool"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-rawdiskCreator"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-remotemks"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-usbarbitrator"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-vdiskmanager"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-vmdkserver"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-vmx"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-vmx-debug"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/vmware-vmx-stats"
  binary "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/VMware OVF Tool/ovftool"

  postflight do
    system_command "#{appdir}/VMware Fusion Tech Preview.app/Contents/Library/Initialize VMware Fusion.tool",
                   args: ['set'],
                   sudo: true
  end

  uninstall_preflight do
    set_ownership "#{appdir}/VMware Fusion Tech Preview.app"
  end

  uninstall delete: '/etc/paths.d/com.vmware.fusion.public'

  zap trash: [
               '/Library/Application Support/VMware',
               '/Library/Logs/VMware Fusion Services.log',
               '/Library/Logs/VMware USB Arbitrator Service.log',
               '/Library/Logs/VMware',
               '/Library/Preferences/VMware Fusion',
               '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.vmware.fusion.sfl*',
               '~/Library/Application Support/VMware Fusion',
               '~/Library/Application Support/VMware Fusion Applications Menu',
               '~/Library/Caches/com.vmware.fusion',
               '~/Library/Logs/VMware Fusion',
               '~/Library/Logs/VMware Fusion Applications Menu',
               '~/Library/Logs/VMware Graphics Service.log',
               '~/Library/Logs/VMware',
               '~/Library/Preferences/VMware Fusion',
               '~/Library/Preferences/com.vmware.fusion.plist',
               '~/Library/Preferences/com.vmware.fusion.plist.lockfile',
               '~/Library/Preferences/com.vmware.fusionApplicationsMenu.helper.plist',
               '~/Library/Preferences/com.vmware.fusionApplicationsMenu.plist',
               '~/Library/Preferences/com.vmware.fusionDaemon.plist',
               '~/Library/Preferences/com.vmware.fusionDaemon.plist.lockfile',
               '~/Library/Preferences/com.vmware.fusionStartMenu.plist',
               '~/Library/Preferences/com.vmware.fusionStartMenu.plist.lockfile',
               '~/Library/Preferences/com.vmware.fusion.LSSharedFileList.plist',
               '~/Library/Preferences/com.vmware.fusion.LSSharedFileList.plist.lockfile',
               '~/Library/Saved Application State/com.vmware.fusion.savedState',
               '~/Library/WebKit/com.vmware.fusion',
               '~/.nautilus',
             ]

  caveats do
    kext
  end
end
