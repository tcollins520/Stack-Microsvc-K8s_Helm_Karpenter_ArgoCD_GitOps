{{/*
Expand the name of the chart.
*/}}
{{- define "carts.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create fully qualified name.
*/}}
{{- define "carts.fullname" -}}
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
{{- define "carts.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "carts.labels" -}}
helm.sh/chart: {{ include "carts.chart" . }}
{{ include "carts.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{/*
Selector labels.
*/}}
{{- define "carts.selectorLabels" -}}
app.kubernetes.io/name: {{ include "carts.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
* ConfigMap name.
*/}}
{{- define "carts.configMapName" -}}
{{ include "carts.fullname" . }}
{{- end }}

{{/*
Pod annotations.
*/}}
{{- define "carts.podAnnotations" -}}
{{- with .Values.podAnnotations }}
{{- toYaml . }}
{{- end }}
{{- end }}

{{/*
ServiceAccount name.
*/}}
{{- define "carts.serviceAccountName" -}}
{{- default .Chart.Name .Values.serviceAccount.name }}
{{- end }}