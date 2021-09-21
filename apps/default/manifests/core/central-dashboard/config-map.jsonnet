local k = import 'k8s-libsonnet/1.21/main.libsonnet';
local cm = k.core.v1.configMap;

cm.new(
  'central-dashboard',
  {
    settings: importstr '../../../configs/central-dashboard-settings.json',
    links: importstr '../../../configs/central-dashboard-links.json',
  }
)
