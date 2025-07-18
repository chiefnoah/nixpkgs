{
  lib,
  buildGraalvmNativeImage,
  fetchurl,
  nix-update-script,
  testers,
}:

buildGraalvmNativeImage (finalAttrs: {
  pname = "cljfmt";
  version = "0.13.1";

  src = fetchurl {
    url = "https://github.com/weavejester/cljfmt/releases/download/${finalAttrs.version}/cljfmt-${finalAttrs.version}-standalone.jar";
    hash = "sha256-Dj1g6hMzRhqm0pJggODVFgEkayB2Wdh3d0z6RglHbgY=";
  };

  extraNativeImageBuildArgs = [
    "-H:+ReportExceptionStackTraces"
    "-H:Log=registerResource:"
    "--initialize-at-build-time"
    "--diagnostics-mode"
    "--report-unsupported-elements-at-runtime"
    "--no-fallback"
  ];

  passthru.updateScript = nix-update-script { };

  passthru.tests.version = testers.testVersion {
    inherit (finalAttrs) version;
    package = finalAttrs.finalPackage;
    command = "cljfmt --version";
  };

  meta = {
    mainProgram = "cljfmt";
    description = "Tool for formatting Clojure code";
    homepage = "https://github.com/weavejester/cljfmt";
    sourceProvenance = with lib.sourceTypes; [ binaryBytecode ];
    license = lib.licenses.epl10;
    changelog = "https://github.com/weavejester/cljfmt/blob/${finalAttrs.version}/CHANGELOG.md";
    maintainers = with lib.maintainers; [ sg-qwt ];
  };
})
