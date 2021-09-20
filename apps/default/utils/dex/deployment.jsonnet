local k = import 'k8s-libsonnet/1.21/main.libsonnet';

k.apps.v1.deployment.new(
  'abc', containers=[
    {
      image: 'ghcr.io/dexidp/dex:v2.30.0',
      name: 'dex',
      command: ['dex', 'serve', '/etc/dex/cfg/config.yaml'],
      ports: [
        {
          name: 'http',
          containerPort: 5556,
        },
      ],
      volumeMounts: [
        {
          name: 'config',
          mountPath: '/etc/dex/cfg',
        },
      ],
      envFrom: [
        {
          secretRef: {
            name: 'dex-oidc-client',
          },
        },
      ],
      env: [
        {
          name: 'KUBERNETES_POD_NAMESPACE',
          valueFrom: {
            fieldRef: {
              fieldPath: 'metadata.namespace',
            },
          },
        },
      ],
    },
  ]
)
