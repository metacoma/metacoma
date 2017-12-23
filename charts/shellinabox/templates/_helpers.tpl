{{- define "shellinabox.fullname" -}}
{{- printf "shellinabox-%s" .Release.Name  | trunc 63 | trimSuffix "-" -}}
{{- end -}}