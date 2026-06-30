default: build

build *ARGS:
    cargo build {{ARGS}}

build-image LABEL:
    podman build -t porter:{{LABEL}} .

save-image LABEL: (build-image LABEL)
    mkdir -p dist
    rm -f dist/porter-{{LABEL}}.tar
    podman save porter:{{LABEL}} -o dist/porter-{{LABEL}}.tar
