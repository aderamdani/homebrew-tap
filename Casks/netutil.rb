cask "netutil" do
  version "4.19.0"
  sha256 "e07032027ffba31c86456f08c1d48b5161500d946487e010eaa5ea7a221471dd"

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
