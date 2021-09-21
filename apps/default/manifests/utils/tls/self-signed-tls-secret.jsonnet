local k = import 'k8s-libsonnet/1.21/main.libsonnet';
local sc = k.core.v1.secret;
local data = {
  'tls.crt': std.base64(importstr 'resources/tls/tls.crt'),
  'tls.key': std.base64(importstr 'resources/tls/tls.key'),
};

sc.new('self-signed-tls-secret', data, 'kubernetes.io/tls')
+
sc.metadata.withAnnotations(
  {
    'kubed.appscode.com/sync': '',
  }
)