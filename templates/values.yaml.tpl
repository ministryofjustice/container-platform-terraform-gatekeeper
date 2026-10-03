logLevel: INFO
constraintViolationsLimit: ${constraint_violations_max_to_display}
auditFromCache: ${audit_from_cache}
enableDeleteOperations: true
mutationAnnotations: true
# Annotate the controller/webhook and audit pods so the CP3 ADOT collector's
# annotation-driven kubernetes-pods scrape job discovers their metrics on
# :8888 (constraint violations, audit, and request/webhook metrics). Gatekeeper
# exposes no metrics Service, so pod annotations are the discovery mechanism.
podAnnotations:
  prometheus.io/scrape: "true"
  prometheus.io/port: "8888"
auditPodAnnotations:
  prometheus.io/scrape: "true"
  prometheus.io/port: "8888"
postInstall:
  labelNamespace:
    enabled: ${post_install_label_namespace}
controllerManager:
  resources:
      limits:
        memory: ${controller_mem_limit}
      requests:
        cpu: 100m
        memory: ${controller_mem_req}
  exemptNamespaces: ["kube-system"]
  # nodeSelector:
  #   container-platform.justice.gov.uk/system-ng: "true"
  # tolerations:
  #   - key: "system-node"
  #     operator: "Equal"
  #     value: "true"
  #     effect: "NoSchedule"
audit:
  resources:
      limits:
        memory: ${audit_mem_limit}
      requests:
        cpu: 100m
        memory: ${audit_mem_req}
  # nodeSelector:
  #   container-platform.justice.gov.uk/system-ng: "true"
  # tolerations:
  #   - key: "system-node"
  #     operator: "Equal"
  #     value: "true"
  #     effect: "NoSchedule"
psp:
  enabled: false
