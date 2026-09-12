cask "netutil" do
  version "4.16.0"
  sha256 "eb1c63cc540f9c945c8cd9c6df25b6fc1c32872f67b5d9d4ecaa016d9020a96e"

  url "https://github.com/aderamdani/NetUtil/releases/download/v#{version}/NetUtil-#{version}.dmg"
  name "NetUtil"
  desc "Network diagnostics and monitoring toolkit"
  homepage "https://github.com/aderamdani/NetUtil"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "NetUtil.app"

  uninstall quit: "Vertex-Data.NetUtil"

  zap trash: [
    "~/Library/Caches/Vertex-Data.NetUtil",
    "~/Library/HTTPStorages/Vertex-Data.NetUtil",
    "~/Library/Preferences/Vertex-Data.NetUtil.plist",
  ]

  caveats <<~EOS
    NetUtil is ad-hoc signed and not notarized, so Gatekeeper blocks the first
    launch. After installing, clear the quarantine flag:

      xattr -dr com.apple.quarantine "#{appdir}/NetUtil.app"

    or right-click NetUtil in Applications and choose Open.
  EOS
end
