  class Provengo < Formula
    desc "Scenario-based modeling and testing tool"
    homepage "https://www.provengo.tech/"
    url "https://downloads.provengo.tech/releases/Provengo-2025-03-30.uber.jar"
    version "0.9.5"
    sha256 "026559c7471949026ff9f9afc66a2bf370c3164e1170b7e3b77a32c780ff2a32"

    depends_on "openjdk@17"
    depends_on "graphviz"

    def install
      libexec.install "Provengo-2025-03-30.uber.jar"
      (bin/"provengo").write <<~EOS
        #!/bin/bash
        exec "#{Formula["openjdk@17"].opt_bin}/java" -jar "#{libexec}/Provengo-2025-03-30.uber.jar" "$@"
      EOS
    end

    test do
      system "#{bin}/provengo", "--version"
    end
  end

