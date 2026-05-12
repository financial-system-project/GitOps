{{- define "transaction-service.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "transaction-service.labels" -}}
app.kubernetes.io/name: {{ include "transaction-service.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "transaction-service.selectorLabels" -}}
app: {{ include "transaction-service.fullname" . }}
{{- end }}