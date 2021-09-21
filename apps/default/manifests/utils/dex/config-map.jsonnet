local k = import 'k8s-libsonnet/1.21/main.libsonnet';
local cm = k.core.v1.configMap;

cm.new('dex',
{
    'config.yaml': importstr '../../../configs/dex.yaml'
}
)