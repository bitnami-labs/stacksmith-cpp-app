#!/bin/bash

set -eu -o pipefail

yum install -y boost

mkdir -p /opt/app/web

cat >/opt/app/web/index.html <<EOF
<h1>Welcome</h1>
<br /><br />
<a href="/info">See info</a>
EOF

mv "${UPLOADS_DIR}/http_examples" /opt/app/
chmod 0755 /opt/app/http_examples

