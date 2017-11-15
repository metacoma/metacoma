{{- define "spinnaker.fullname" -}}
{{- printf "spinnaker-%s" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "spinnaker.minio-address" -}}
    {{- if .Values.minio.deployChart -}}
        http://{{- template "minio.fullname" . -}}:{{ .Values.minio.port }}
    {{- else -}}
        {{- printf "%s" .Values.minio.externalAddress -}}
    {{- end -}}
{{- end -}}

{{- define "spinnaker.redis-address" -}}
    {{- if or .Values.redis.deployChart (not .Values.redis.externalAddress) -}}
        redis://:{{ .Values.redis.redisPassword }}@{{ template "redis.fullname" . }}:{{ .Values.redis.service.port }}
    {{- else -}}
        {{- printf "%s" .Values.redis.externalAddress -}}
    {{- end -}}
{{- end -}}
