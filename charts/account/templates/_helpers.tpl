{{- define "account-service.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "account-service.labels" -}}
app.kubernetes.io/name: {{ include "account-service.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "account-service.selectorLabels" -}}
app: {{ include "account-service.fullname" . }}
{{- end }}