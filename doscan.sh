#!/bin/bash
PROJNAME="Demo Small 2024"
curl -s -L https://detect.synopsys.com/detect9.sh > /tmp/detect9.sh

bash /tmp/detect9.sh --blackduck.trust.cert=true \
--detect.project.name="$PROJNAME" --detect.project.version.name=1.0_latest \
--detect.blackduck.signature.scanner.snippet.matching=SNIPPET_MATCHING \
--detect.blackduck.signature.scanner.license.search=true \
--detect.blackduck.signature.scanner.copyright.search=true \
--detect.binary.scan.file.path=System.Data.SQLite.dll \
--detect.blackduck.signature.scanner.upload.source.mode=true \
--detect.tools=DETECTOR,SIGNATURE_SCAN,BINARY_SCAN,IAC_SCAN \
--detect.project.version.phase=RELEASED

bash /tmp/detect9.sh --blackduck.trust.cert=true \
--detect.project.name="$PROJNAME" --detect.project.version.name=2.0_latest \
--detect.blackduck.signature.scanner.license.search=true \
--detect.blackduck.signature.scanner.copyright.search=true \
--detect.tools=DETECTOR \
--detect.project.version.phase=PRERELEASE

bash /tmp/detect9.sh --blackduck.trust.cert=true \
--detect.project.name="$PROJNAME" --detect.project.version.name=3.0_latest \
--detect.blackduck.signature.scanner.snippet.matching=SNIPPET_MATCHING \
--detect.blackduck.signature.scanner.license.search=true \
--detect.blackduck.signature.scanner.copyright.search=true \
--detect.blackduck.signature.scanner.upload.source.mode=true \
--detect.tools=SIGNATURE_SCAN \
--detect.project.version.phase=DEVELOPMENT
