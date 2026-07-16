cask "ccglance" do
  version "1.6.0"
  sha256 "0b2b315a50576fcccbd1c69f87303383139eefcaecdb51f60786c7da2be10f68"

  url "https://github.com/hatoya/ccglance/releases/download/v#{version}/ccglance.zip"
  name "ccglance"
  desc "Always-on-top floating panel that shows Claude Code session status"
  homepage "https://github.com/hatoya/ccglance"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "ccglance.app"

  uninstall quit: "com.hatoya.ccglance"

  zap trash: "~/.claude/ccglance"

  caveats <<~EOS
    ccglance requires Node.js (for the Claude Code hooks).
    On first launch it registers hooks in ~/.claude/settings.json.
    To unregister them, run this BEFORE `brew uninstall`:
      node "#{appdir}/ccglance.app/Contents/Resources/uninstall.js"
  EOS
end
