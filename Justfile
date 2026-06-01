default: build

build *ARGS:
    cargo build {{ARGS}}

build-image LABEL:
    podman build -t owt_streaming_service:{{LABEL}} .

save-image LABEL: (build-image LABEL)
    mkdir -p dist
    rm -f dist/owt_streaming_service-{{LABEL}}.tar
    podman save owt_streaming_service:{{LABEL}} -o dist/owt_streaming_service-{{LABEL}}.tar
