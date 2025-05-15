cask "provengo" do
  version "0.9.5"
  sha256 "c63c50ed4b8d7e12a7dda289e3503d8bdd92cd9b1b7dd0dfa6c5c62df8a9a0a8"

  url "https://downloads.provengo.tech/releases/Provengo-2025-03-30.uber.jar"
  name "Provengo"
  desc "Scenario-based modeling and testing tool"
  homepage "https://www.provengo.tech/"

  depends_on cask: "temurin@11"

  binary "#{staged_path}/provengo"

  postflight do
    File.write("#{staged_path}/provengo", <<~EOS)
      #!/bin/bash
      JAVA_HOME="$(/usr/libexec/java_home -v11 2>/dev/null)"
      if [ -z "$JAVA_HOME" ]; then
        echo "Error: Java 11 is not installed or not found"
        exit 1
      fi
      exec "$JAVA_HOME/bin/java" -jar "#{staged_path}/Provengo-2025-03-30.uber.jar" "$@"
    EOS
    File.chmod(0755, "#{staged_path}/provengo")
  end
end

