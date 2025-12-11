{
  maven,
  lib
}:
maven.buildMavenPackage rec {
  pname = "MeeSignHelper";
  version = "1.0-SNAPSHOT";

  src = ./.;

  mvnHash = "sha256-DAhOuEiULIJhfq5RRmryju63NCUz/GTrGqO9dHu3jFE=";

  mvnParameters = lib.escapeShellArgs [
    "compile"
    "assembly:single"
  ];

  outputName = "signPDF-${version}-jar-with-dependencies.jar";

  installPhase = ''
    install --preserve-timestamps target/${outputName} -D --target-directory $out/
    mv $out/${outputName} $out/${pname}.jar
  '';
}
