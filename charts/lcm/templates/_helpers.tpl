{{- define "lcm.fullname" -}}
{{- printf "lcm-%s" .Release.Name | trunc 53 | trimSuffix "-" -}}
{{- end -}}

{{- define "lcm.apocng.fullname" -}}
{{- printf "apocng-%s" .Release.Name | trunc 53 | trimSuffix "-" -}}
{{- end -}}

{{- define "lcm.nginx-basic-auth.fullname" -}}
{{- printf "nginx-basic-auth-%s" .Release.Name | trunc 53 | trimSuffix "-" -}}
{{- end -}}

{{- define "lcm.deck-address" -}}
{{ template "spinnaker.fullname" . }}-deck:{{ .Values.spinnaker.ui.port }}
{{- end -}}

{{- define "lcm.gate-address" -}}
{{ template "spinnaker.fullname" . }}-gate:8084
{{- end -}}

{{- define "lcm.redis-address" -}}
{{ template "redis.fullname" . }}.{{ .Release.Namespace }}.svc.cluster.local:{{ .Values.spinnaker.redis.service.port }}
{{- end -}}