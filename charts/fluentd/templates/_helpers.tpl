{{- define "fluentd.fullname" -}}
{{- printf "fluentd-%s" .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}