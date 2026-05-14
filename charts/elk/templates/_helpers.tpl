{{/*
Expand the name of the chart.
*/}}
{{- define "elk.name" -}}
{{- .Chart.Name }}
{{- end }}

{{- define "elk.elasticsearch.fullname" -}}
elasticsearch
{{- end }}

{{- define "elk.logstash.fullname" -}}
logstash
{{- end }}

{{- define "elk.kibana.fullname" -}}
kibana
{{- end }}

{{- define "elk.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
