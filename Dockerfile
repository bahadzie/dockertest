FROM alpine:3.18

RUN apk --no-cache add R R-dev g++ pandoc-cli && \
R -q -e 'install.packages("pak", repos = sprintf("https://r-lib.github.io/p/pak/stable/%s/%s/%s",  .Platform$pkgType,  R.Version()$os,  R.Version()$arch))' && \
R -q -e 'pak::pak("any::rmarkdown")'
