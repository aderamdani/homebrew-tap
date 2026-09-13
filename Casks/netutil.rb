cask "netutil" do
  version "4.17.0"
  sha256 "f3dd9f1a940ab2bfd522d62c57ae22b5429b63d9750ff28cc014ba5ef416c3ce"

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
