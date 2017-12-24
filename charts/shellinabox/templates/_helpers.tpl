{{- define "shellinabox.fullname" -}}
{{- printf "shellinabox-%s" .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "shellinabox-logs.fullname" -}}
{{- printf "shellinabox-logs-%s" .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}