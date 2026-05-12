{{- define "notification-service.fullname" -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "notification-service.labels" -}}
app.kubernetes.io/name: {{ include "notification-service.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "notification-service.selectorLabels" -}}
app: {{ include "notification-service.fullname" . }}
{{- end }}