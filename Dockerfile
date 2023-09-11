FROM alpine:3.18

RUN apk --no-cache add R R-dev g++ pandoc-cli

# any::covr
# any::cffr
# any::V8
# any::rcmdcheck
# any::pkgdown

# spelling
# testthat
# Roxygen