{{- define "syslog.fullname" -}}
{{- printf "syslog-%s" .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}