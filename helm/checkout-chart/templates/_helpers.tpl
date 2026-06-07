{{/*
Expand the name of the chart.
*/}}
{{- define "checkout.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create fully qualified name.
*/}}
{{- define "checkout.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Chart name and version.
*/}}
{{- define "checkout.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "checkout.labels" -}}
helm.sh/chart: {{ include "checkout.chart" . }}
{{ include "checkout.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Selector labels.
*/}}
{{- define "checkout.selectorLabels" -}}
app.kubernetes.io/name: {{ include "checkout.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
* ConfigMap name.
*/}}
{{- define "checkout.configMapName" -}}
{{- default (include "checkout.fullname" .) .Values.configMap.name }}
{{- end }}

{{/*
Pod annotations.
*/}}
{{- define "checkout.podAnnotations" -}}
{{- with .Values.podAnnotations }}
{{- toYaml . }}
{{- end }}
{{- end }}

{{/*
ServiceAccount name.
*/}}
{{- define "checkout.serviceAccountName" -}}
{{- default .Chart.Name .Values.serviceAccount.name }}
{{- end }}