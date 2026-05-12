{{- define "budget-service.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "budget-service.labels" -}}
app.kubernetes.io/name: {{ include "budget-service.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "budget-service.selectorLabels" -}}
app: {{ include "budget-service.fullname" . }}
{{- end }}